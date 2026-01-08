import 'dart:convert';

import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';

class NotificationService implements INotificationService {
  final IEmailService _emailService;
  final ILocalNotificationService _localNotificationService;
  EmailConfig? _emailConfig;

  NotificationService({
    required IEmailService emailService,
    required ILocalNotificationService localNotificationService,
  })  : _emailService = emailService,
        _localNotificationService = localNotificationService;

  void setEmailConfig(EmailConfig? config) {
    _emailConfig = config;
  }

  @override
  Future<Result<Unit>> notifyLocal(AppLog log) async {
    if (log.category == AppLogCategory.print && log.printerId != null) {
      final printerName = log.printerId ?? 'Impressora';
      await _localNotificationService.showPrinterError(
        printerName: printerName,
        error: log.message,
      );
    }

    return Success(unit);
  }

  @override
  Future<Result<Unit>> notifyEmail(
    AppLog log, {
    required Future<bool> Function() confirmCallback,
  }) async {
    if (_emailConfig == null || !_emailConfig!.enabled) {
      return Success(unit);
    }

    final shouldSend = await confirmCallback();
    if (!shouldSend) {
      return Success(unit);
    }

    final emailMessage = _buildEmailMessage(log);
    return await _emailService.sendEmail(_emailConfig!, emailMessage);
  }

  @override
  Future<Result<Unit>> notify(
    AppLog log, {
    NotificationType type = NotificationType.local,
    Future<bool> Function()? confirmCallback,
  }) async {
    if (type == NotificationType.local || type == NotificationType.both) {
      await notifyLocal(log);
    }

    if ((type == NotificationType.email || type == NotificationType.both) &&
        shouldNotifyByEmail(log)) {
      if (confirmCallback != null) {
        await notifyEmail(log, confirmCallback: confirmCallback);
      }
    }

    return Success(unit);
  }

  @override
  bool shouldNotifyByEmail(AppLog log) {
    if (_emailConfig == null || !_emailConfig!.enabled) {
      return false;
    }

    if (log.level != AppLogLevel.error && log.level != AppLogLevel.fatal) {
      return false;
    }

    switch (log.category) {
      case AppLogCategory.print:
        return _emailConfig!.notifyOnPrintFailure;
      case AppLogCategory.host:
        return _emailConfig!.notifyOnPrinterOffline;
      case AppLogCategory.auth:
        return _emailConfig!.notifyOnAuthFailure;
      case AppLogCategory.system:
        return false;
    }
  }

  EmailMessage _buildEmailMessage(AppLog log) {
    final levelEmoji = _getLevelEmoji(log.level);
    final subject = '$levelEmoji Magic Printer - ${log.title}';

    final body = '''
      <!DOCTYPE html>
      <html>
      <head>
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; }
          .header { background: ${_getLevelColor(log.level)}; color: white; padding: 20px; }
          .content { padding: 20px; }
          .details { background: #f5f5f5; padding: 15px; border-radius: 5px; margin: 10px 0; }
          .footer { color: #666; font-size: 12px; padding: 20px; text-align: center; }
          table { width: 100%; border-collapse: collapse; }
          td { padding: 8px; border-bottom: 1px solid #ddd; }
          td:first-child { font-weight: bold; width: 150px; }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>$levelEmoji ${log.level.name.toUpperCase()}</h1>
          <h2>${log.title}</h2>
        </div>
        <div class="content">
          <p><strong>Mensagem:</strong></p>
          <div class="details">${log.message}</div>
          
          <table>
            <tr>
              <td>Categoria</td>
              <td>${log.category.name}</td>
            </tr>
            <tr>
              <td>Data/Hora</td>
              <td>${_formatDateTime(log.createdAt)}</td>
            </tr>
            ${log.printerId != null ? '<tr><td>Impressora ID</td><td>${log.printerId}</td></tr>' : ''}
            ${log.hostId != null ? '<tr><td>Host ID</td><td>${log.hostId}</td></tr>' : ''}
            ${log.jobId != null ? '<tr><td>Job ID</td><td>${log.jobId}</td></tr>' : ''}
          </table>
          
          ${log.details != null ? '<p><strong>Detalhes:</strong></p><div class="details"><pre>${_formatDetails(log.details!)}</pre></div>' : ''}
        </div>
        <div class="footer">
          <p>Magic Printer - Sistema de Gerenciamento de Impressão</p>
          <p><small>Esta é uma notificação automática. Não responda a este email.</small></p>
        </div>
      </body>
      </html>
    ''';

    return EmailMessage(subject: subject, body: body, isHtml: true);
  }

  String _getLevelEmoji(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return '🔍';
      case AppLogLevel.info:
        return 'ℹ️';
      case AppLogLevel.warning:
        return '⚠️';
      case AppLogLevel.error:
        return '❌';
      case AppLogLevel.fatal:
        return '🔥';
    }
  }

  String _getLevelColor(AppLogLevel level) {
    switch (level) {
      case AppLogLevel.debug:
        return '#6c757d';
      case AppLogLevel.info:
        return '#0d6efd';
      case AppLogLevel.warning:
        return '#ffc107';
      case AppLogLevel.error:
        return '#dc3545';
      case AppLogLevel.fatal:
        return '#8b0000';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }

  String _formatDetails(String details) {
    try {
      final parsed = jsonDecode(details);
      return const JsonEncoder.withIndent('  ').convert(parsed);
    } catch (_) {
      return details;
    }
  }
}
