import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import '../../infrastructure/infrastructure.dart';
import 'safe_notifier_mixin.dart';

class NotificationProvider extends ChangeNotifier with SafeNotifierMixin {
  final IEmailService _emailService;
  final AppDatabase _database;
  final ILocalNotificationService _localNotificationService;
  final PrinterStatusMonitorService? _printerStatusMonitorService;

  EmailConfig? _emailConfig;
  bool _isLoading = false;
  bool _isTesting = false;
  bool _localNotificationsEnabled = true;
  String? _error;
  String? _successMessage;

  static const _uuid = Uuid();

  NotificationProvider({
    required IEmailService emailService,
    required AppDatabase database,
    required ILocalNotificationService localNotificationService,
    PrinterStatusMonitorService? printerStatusMonitorService,
  })  : _emailService = emailService,
        _database = database,
        _localNotificationService = localNotificationService,
        _printerStatusMonitorService = printerStatusMonitorService {
    _loadConfig();
  }

  EmailConfig? get emailConfig => _emailConfig;
  bool get isLoading => _isLoading;
  bool get isTesting => _isTesting;
  bool get localNotificationsEnabled => _localNotificationsEnabled;
  String? get error => _error;
  String? get successMessage => _successMessage;

  bool get isConfigured => _emailConfig != null && _emailConfig!.enabled;

  Future<void> _loadConfig() async {
    _isLoading = true;
    notifyListeners();

    try {
      final configs = await _database.select(_database.emailConfigs).get();
      if (configs.isNotEmpty) {
        _emailConfig = _mapToEntity(configs.first);
      }
    } catch (e) {
      _error = 'Erro ao carregar configuração: $e';
    }

    _isLoading = false;
    _updateNotificationServices(_localNotificationsEnabled);
    notifyListeners();
  }

  Future<void> saveLocalNotificationsEnabled(bool value) async {
    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      _localNotificationsEnabled = value;
      _updateNotificationServices(value);
      _isLoading = false;
    } catch (e) {
      _error = 'Erro ao salvar configuração: $e';
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> saveConfig(EmailConfig config) async {
    _isLoading = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    try {
      final companion = EmailConfigsCompanion.insert(
        id: config.id,
        smtpHost: config.smtpHost,
        smtpPort: config.smtpPort,
        useSsl: Value(config.useSsl),
        username: config.username,
        password: config.password,
        fromEmail: config.fromEmail,
        toEmail: config.toEmail,
        enabled: Value(config.enabled),
        notifyOnPrintFailure: Value(config.notifyOnPrintFailure),
        notifyOnPrinterOffline: Value(config.notifyOnPrinterOffline),
        notifyOnJobStuck: Value(config.notifyOnJobStuck),
        notifyOnAuthFailure: Value(config.notifyOnAuthFailure),
      );

      await _database
          .into(_database.emailConfigs)
          .insertOnConflictUpdate(companion);

      _emailConfig = config;
      _successMessage = 'Configuração salva com sucesso!';
    } catch (e) {
      _error = 'Erro ao salvar configuração: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> testConnection() async {
    if (_emailConfig == null) {
      _error = 'Configure o email antes de testar';
      notifyListeners();
      return;
    }

    _isTesting = true;
    _error = null;
    _successMessage = null;
    notifyListeners();

    final result = await _emailService.testConnection(_emailConfig!);

    if (result.isSuccess()) {
      _successMessage = 'Conexão testada com sucesso! Verifique seu email.';
    } else {
      _error = 'Falha no teste de conexão: ${result.exceptionOrNull()}';
    }

    _isTesting = false;
    notifyListeners();
  }

  EmailConfig createDefaultConfig() {
    return EmailConfig(
      id: _uuid.v4(),
      smtpHost: 'smtp.gmail.com',
      smtpPort: 587,
      useSsl: true,
      username: '',
      password: '',
      fromEmail: '',
      toEmail: '',
      enabled: false,
    );
  }

  void clearMessages() {
    _error = null;
    _successMessage = null;
    notifyListeners();
  }

  EmailConfig _mapToEntity(EmailConfigEntry entry) {
    return EmailConfig(
      id: entry.id,
      smtpHost: entry.smtpHost,
      smtpPort: entry.smtpPort,
      useSsl: entry.useSsl,
      username: entry.username,
      password: entry.password,
      fromEmail: entry.fromEmail,
      toEmail: entry.toEmail,
      enabled: entry.enabled,
      notifyOnPrintFailure: entry.notifyOnPrintFailure,
      notifyOnPrinterOffline: entry.notifyOnPrinterOffline,
      notifyOnJobStuck: entry.notifyOnJobStuck,
      notifyOnAuthFailure: entry.notifyOnAuthFailure,
    );
  }

  void _updateNotificationServices(bool enabled) {
    _localNotificationService.setEnabled(enabled);
    _printerStatusMonitorService?.setEnabled(enabled);
  }
}
