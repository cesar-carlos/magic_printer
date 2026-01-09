import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';

class ActionExecutorService implements IActionExecutorService {
  final IActionRuleRepository _actionRuleRepository;
  final IPrinterRepository _printerRepository;
  final IPrinterHealthRepository _healthRepository;
  final ILocalNotificationService _notificationService;

  Timer? _evaluationTimer;
  bool _isEnabled = false;
  final _actionStreamControllers = <String, StreamController<AutomatedAction>>{};
  final _uuid = const Uuid();

  ActionExecutorService({
    required IActionRuleRepository actionRuleRepository,
    required IPrinterRepository printerRepository,
    required IPrinterHealthRepository healthRepository,
    required ILocalNotificationService notificationService,
  })  : _actionRuleRepository = actionRuleRepository,
        _printerRepository = printerRepository,
        _healthRepository = healthRepository,
        _notificationService = notificationService;

  @override
  bool get isEnabled => _isEnabled;

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
      defaultActionCheckInterval,
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
      await evaluateAndExecute(printer.id);
    }
  }

  @override
  Future<Result<List<AutomatedAction>>> evaluateAndExecute(
    String printerId,
  ) async {
    try {
      final rulesResult = await _actionRuleRepository.getAllRules();
      if (rulesResult.isError()) {
        return Failure(rulesResult.exceptionOrNull()!);
      }

      final rules = rulesResult.getOrThrow();
      final enabledRules = rules.where((r) => r.enabled).toList();
      final executedActions = <AutomatedAction>[];

      for (final rule in enabledRules) {
        final shouldExecute = await _checkTrigger(rule, printerId);
        if (shouldExecute) {
          final actionResult = await executeRule(rule, printerId);
          if (actionResult.isSuccess()) {
            executedActions.add(actionResult.getOrThrow());
          }
        }
      }

      return Success(executedActions);
    } catch (e) {
      return Failure(
        StorageException(
          'E_ACTION_EXECUTION_FAILED',
          'Failed to evaluate and execute actions for printer $printerId: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<AutomatedAction>> executeRule(
    ActionRule rule,
    String printerId,
  ) async {
    try {
      final action = AutomatedAction(
        id: _uuid.v4(),
        ruleId: rule.id,
        printerId: printerId,
        actionType: rule.actionType,
        parameters: rule.conditions,
        result: ActionResult.success,
        executedAt: DateTime.now(),
      );

      ActionResult result = ActionResult.success;
      String? errorMessage;

      try {
        switch (rule.actionType) {
          case ActionType.pausePrinter:
            await _pausePrinter(printerId);
            break;
          case ActionType.sendAlert:
            await _sendAlert(printerId, rule);
            break;
          case ActionType.redirectJobs:
          case ActionType.clearQueue:
          case ActionType.restartService:
            break;
        }
      } catch (e) {
        result = ActionResult.failed;
        errorMessage = e.toString();
      }

      final finalAction = action.copyWith(
        result: result,
        errorMessage: errorMessage,
      );

      await _actionRuleRepository.recordExecution(finalAction);
      _notifyAction(printerId, finalAction);

      await _actionRuleRepository.updateRule(
        rule.copyWith(lastExecuted: DateTime.now()),
      );

      return Success(finalAction);
    } catch (e) {
      return Failure(
        StorageException(
          'E_ACTION_EXECUTION_FAILED',
          'Failed to execute rule ${rule.id}: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Stream<AutomatedAction> watchActions(String printerId) {
    if (!_actionStreamControllers.containsKey(printerId)) {
      _actionStreamControllers[printerId] =
          StreamController<AutomatedAction>.broadcast();
    }
    return _actionStreamControllers[printerId]!.stream;
  }

  Future<bool> _checkTrigger(ActionRule rule, String printerId) async {
    switch (rule.triggerType) {
      case TriggerType.healthLow:
        final threshold = rule.conditions['threshold'] as int? ?? defaultHealthScoreThreshold;
        final healthResult = await _healthRepository.getHealth(printerId);
        if (healthResult.isSuccess()) {
          final health = healthResult.getOrThrow();
          return health.healthScore <= threshold;
        }
        return false;

      case TriggerType.tonerLow:
        final threshold = rule.conditions['threshold'] as int? ?? defaultTonerLowThreshold;
        final printerResult = await _printerRepository.getById(printerId);
        if (printerResult.isSuccess()) {
          final printer = printerResult.getOrThrow();
          if (printer.tonerLevel != null) {
            final level = int.tryParse(printer.tonerLevel!) ?? 100;
            return level <= threshold;
          }
        }
        return false;

      case TriggerType.paperLow:
        final threshold = rule.conditions['threshold'] as int? ?? defaultPaperLowThreshold;
        final printerResult = await _printerRepository.getById(printerId);
        if (printerResult.isSuccess()) {
          final printer = printerResult.getOrThrow();
          if (printer.paperLevel != null) {
            final level = int.tryParse(printer.paperLevel!) ?? 100;
            return level <= threshold;
          }
        }
        return false;

      case TriggerType.queueSize:
      case TriggerType.errorThreshold:
      case TriggerType.schedule:
        return false;
    }
  }

  Future<void> _pausePrinter(String printerId) async {
    final printerResult = await _printerRepository.getById(printerId);
    if (printerResult.isSuccess()) {
      final printer = printerResult.getOrThrow();
      await _printerRepository.update(
        printer.copyWith(status: PrinterStatus.paused),
      );
    }
  }

  Future<void> _sendAlert(String printerId, ActionRule rule) async {
    final printerResult = await _printerRepository.getById(printerId);
    if (printerResult.isSuccess()) {
      final printer = printerResult.getOrThrow();
      await _notificationService.showPrinterError(
        printerName: printer.displayName,
        error: rule.description,
      );
    }
  }

  void _notifyAction(String printerId, AutomatedAction action) {
    final controller = _actionStreamControllers[printerId];
    if (controller != null && !controller.isClosed) {
      controller.add(action);
    }
  }

  void dispose() {
    _stopEvaluation();
    for (final controller in _actionStreamControllers.values) {
      controller.close();
    }
    _actionStreamControllers.clear();
  }
}
