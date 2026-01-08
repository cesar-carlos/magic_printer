import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';

class EmailService implements IEmailService {
  @override
  Future<Result<Unit>> sendEmail(
    EmailConfig config,
    EmailMessage emailMessage,
  ) async {
    try {
      final smtpServer = _createSmtpServer(config);

      final message = Message()
        ..from = Address(config.fromEmail)
        ..recipients.add(config.toEmail)
        ..subject = emailMessage.subject;

      if (emailMessage.isHtml) {
        message.html = emailMessage.body;
      } else {
        message.text = emailMessage.body;
      }

      await send(message, smtpServer);
      return Success(unit);
    } catch (e) {
      return Failure(
        NetworkException('E_EMAIL_SEND_FAILED', 'Failed to send email: $e'),
      );
    }
  }

  @override
  Future<Result<Unit>> testConnection(EmailConfig config) async {
    try {
      final smtpServer = _createSmtpServer(config);

      final testMessage = Message()
        ..from = Address(config.fromEmail)
        ..recipients.add(config.toEmail)
        ..subject = 'Magic Printer - Teste de Conexão'
        ..html = '''
          <h2>Teste de Conexão</h2>
          <p>Este é um email de teste do Magic Printer.</p>
          <p>Sua configuração de email está funcionando corretamente!</p>
          <p><small>Data: ${DateTime.now().toIso8601String()}</small></p>
        ''';

      await send(testMessage, smtpServer);
      return Success(unit);
    } catch (e) {
      return Failure(
        NetworkException(
          'E_EMAIL_TEST_FAILED',
          'Failed to test email connection: $e',
        ),
      );
    }
  }

  SmtpServer _createSmtpServer(EmailConfig config) {
    return SmtpServer(
      config.smtpHost,
      port: config.smtpPort,
      ssl: config.useSsl,
      username: config.username,
      password: config.password,
      allowInsecure: !config.useSsl,
    );
  }
}
