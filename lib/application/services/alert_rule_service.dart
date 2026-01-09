import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';
import '../../infrastructure/database/repositories/alert_rule_repository.dart';
import '../../infrastructure/external_services/webhook_service.dart';

class AlertRuleService implements IAlertRuleService {
  final AlertRuleRepository _repository;
  final IPrinterHealthRepository _healthRepository;
  final IPrinterRepository _printerRepository;
  final ILocalNotificationService _notificationService;
  final IJobRepository _jobRepository;
  final WebhookService _webhookService;

  Timer? _evaluationTimer;
  bool _isEnabled = false;
  final _alertStreamControllers = <String, StreamController<List<Alert>>>{};
  final _lastAlertTime = <String, DateTime>{};
  final _uuid = const Uuid();

  AlertRuleService({
    required AlertRuleRepository repository,
    required IPrinterHealthRepository healthRepository,
    required IPrinterRepository printerRepository,
    required ILocalNotificationService notificationService,
    required IJobRepository jobRepository,
    WebhookService? webhookService,
  })  : _repository = repository,
        _healthRepository = healthRepository,
        _printerRepository = printerRepository,
        _notificationService = notificationService,
        _jobRepository = jobRepository,
        _webhookService = webhookService ?? WebhookService();

  @override
  Future<Result<List<AlertRule>>> getAllRules() async {
    return await _repository.getAll();
  }

  @override
  Future<Result<AlertRule>> getRule(String id) async {
    return await _repository.getById(id);
  }

  @override
  Future<Result<void>> addRule(AlertRule rule) async {
    return await _repository.add(rule);
  }

  @override
  Future<Result<void>> updateRule(AlertRule rule) async {
    return await _repository.update(rule);
  }

  @override
  Future<Result<void>> deleteRule(String id) async {
    return await _repository.delete(id);
  }

  @override
  Future<Result<List<Alert>>> evaluateRules(String printerId) async {
    try {
      final rulesResult = await _repository.getAll();
      if (rulesResult.isError()) {
        return Failure(rulesResult.exceptionOrNull()!);
      }

      final rules = rulesResult.getOrThrow();
      final enabledRules = rules.where((r) => r.enabled).toList();
      final alerts = <Alert>[];

      for (final rule in enabledRules) {
        final alert = await _evaluateRule(rule, printerId);
        if (alert != null) {
          alerts.add(alert);
          await _executeAlertActions(alert, rule);
        }
      }

      if (alerts.isNotEmpty) {
        _notifyAlerts(printerId, alerts);
      }

      return Success(alerts);
    } catch (e) {
      return Failure(
        StorageException(
          'E_ALERT_EVALUATION_FAILED',
          'Failed to evaluate rules for printer $printerId: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Stream<List<Alert>> watchAlerts(String printerId) {
    if (!_alertStreamControllers.containsKey(printerId)) {
      _alertStreamControllers[printerId] =
          StreamController<List<Alert>>.broadcast();
    }
    return _alertStreamControllers[printerId]!.stream;
  }

  Future<Alert?> _evaluateRule(
    AlertRule rule,
    String printerId,
  ) async {
    try {
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) {
        return null;
      }

      final printer = printerResult.getOrThrow();
      final shouldAlert = await _checkRuleCondition(rule, printer);

      if (!shouldAlert) {
        return null;
      }

      final alertKey = '${rule.id}_$printerId';
      final lastAlert = _lastAlertTime[alertKey];

      if (rule.suppressionTime != null && lastAlert != null) {
        final timeSinceLastAlert = DateTime.now().difference(lastAlert);
        if (timeSinceLastAlert < rule.suppressionTime!) {
          return null;
        }
      }

      _lastAlertTime[alertKey] = DateTime.now();

      final alert = Alert(
        id: _uuid.v4(),
        ruleId: rule.id,
        printerId: printerId,
        severity: rule.severity,
        title: rule.name,
        message: rule.description,
        details: {
          'printerName': printer.displayName,
          'ruleType': rule.type.toString(),
        },
        createdAt: DateTime.now(),
      );

      return alert;
    } catch (e) {
      return null;
    }
  }

  Future<bool> _checkRuleCondition(AlertRule rule, Printer printer) async {
    switch (rule.type) {
      case AlertType.tonerLow:
        final threshold = rule.thresholds['threshold'] as int? ?? defaultTonerLowThreshold;
        if (printer.tonerLevel != null) {
          final level = int.tryParse(printer.tonerLevel!) ?? 100;
          return level <= threshold;
        }
        return false;

      case AlertType.paperLow:
        final threshold = rule.thresholds['threshold'] as int? ?? defaultPaperLowThreshold;
        if (printer.paperLevel != null) {
          final level = int.tryParse(printer.paperLevel!) ?? 100;
          return level <= threshold;
        }
        return false;

      case AlertType.healthLow:
        final threshold = rule.thresholds['threshold'] as int? ?? defaultHealthScoreThreshold;
        final healthResult = await _healthRepository.getHealth(printer.id);
        if (healthResult.isSuccess()) {
          final health = healthResult.getOrThrow();
          return health.healthScore <= threshold;
        }
        return false;

      case AlertType.printerOffline:
        return printer.status == PrinterStatus.offline ||
            printer.status == PrinterStatus.error;

      case AlertType.highErrorRate:
        final threshold = rule.thresholds['errorRate'] as double? ?? 0.1;
        final healthResult = await _healthRepository.getHealth(printer.id);
        if (healthResult.isSuccess()) {
          final health = healthResult.getOrThrow();
          return health.errorRate >= threshold;
        }
        return false;

      case AlertType.queueStuck:
        final thresholdMinutes = rule.thresholds['minutes'] as int? ?? 10;
        final jobsResult = await _jobRepository.getByStatus(PrintJobStatus.spooled);
        if (jobsResult.isSuccess()) {
          final jobs = jobsResult.getOrThrow();
          final printerJobs = jobs.where((j) => j.printerName == printer.name).toList();
          for (final job in printerJobs) {
            final timeSinceCreated = DateTime.now().difference(job.createdAt);
            if (timeSinceCreated.inMinutes >= thresholdMinutes) {
              return true;
            }
          }
        }
        return false;
    }
  }

  Future<void> _executeAlertActions(Alert alert, AlertRule rule) async {
    for (final action in rule.actions) {
      switch (action.type) {
        case AlertActionType.notification:
          await _notificationService.showPrinterError(
            printerName: alert.details['printerName'] as String? ?? 'Unknown',
            error: alert.message,
          );
          break;
        case AlertActionType.webhook:
          final url = action.parameters['url'] as String?;
          if (url != null) {
            final headers = action.parameters['headers'] as Map<String, dynamic>?;
            final headersMap = headers?.map((k, v) => MapEntry(k.toString(), v.toString()));
            await _webhookService.sendAlert(
              url: url,
              alert: alert,
              headers: headersMap,
            );
          }
          break;
        case AlertActionType.email:
        case AlertActionType.pausePrinter:
        case AlertActionType.redirectJobs:
          break;
      }
    }
  }

  void _notifyAlerts(String printerId, List<Alert> alerts) {
    final controller = _alertStreamControllers[printerId];
    if (controller != null && !controller.isClosed) {
      controller.add(alerts);
    }
  }

  @override
  void setEnabled(bool enabled) {
    if (_isEnabled == enabled) return;

    _isEnabled = enabled;

    if (enabled) {
      _startEvaluation();
    } else {
      _stopEvaluation();
    }
  }

  void _startEvaluation() {
    if (_evaluationTimer != null && _evaluationTimer!.isActive) {
      return;
    }

    _evaluationTimer = Timer.periodic(
      defaultAlertCheckInterval,
      (_) => _evaluateAllPrinters(),
    );

    _evaluateAllPrinters();
  }

  void _stopEvaluation() {
    _evaluationTimer?.cancel();
    _evaluationTimer = null;
  }

  Future<void> _evaluateAllPrinters() async {
    final printersResult = await _printerRepository.getAll();
    if (printersResult.isError()) return;

    final printers = printersResult.getOrThrow();
    for (final printer in printers) {
      await evaluateRules(printer.id);
    }
  }

  void dispose() {
    _stopEvaluation();
    for (final controller in _alertStreamControllers.values) {
      controller.close();
    }
    _alertStreamControllers.clear();
    _lastAlertTime.clear();
  }
}
