import 'package:result_dart/result_dart.dart';

import '../entities/email_config.dart';

class EmailMessage {
  final String subject;
  final String body;
  final bool isHtml;

  const EmailMessage({
    required this.subject,
    required this.body,
    this.isHtml = true,
  });
}

abstract class IEmailService {
  Future<Result<Unit>> sendEmail(
    EmailConfig config,
    EmailMessage message,
  );

  Future<Result<Unit>> testConnection(EmailConfig config);
}
