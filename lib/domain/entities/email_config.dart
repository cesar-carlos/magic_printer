class EmailConfig {
  final String id;
  final String smtpHost;
  final int smtpPort;
  final bool useSsl;
  final String username;
  final String password;
  final String fromEmail;
  final String toEmail;
  final bool enabled;
  final bool notifyOnPrintFailure;
  final bool notifyOnPrinterOffline;
  final bool notifyOnJobStuck;
  final bool notifyOnAuthFailure;

  const EmailConfig({
    required this.id,
    required this.smtpHost,
    required this.smtpPort,
    this.useSsl = true,
    required this.username,
    required this.password,
    required this.fromEmail,
    required this.toEmail,
    this.enabled = false,
    this.notifyOnPrintFailure = true,
    this.notifyOnPrinterOffline = true,
    this.notifyOnJobStuck = true,
    this.notifyOnAuthFailure = true,
  });

  EmailConfig copyWith({
    String? id,
    String? smtpHost,
    int? smtpPort,
    bool? useSsl,
    String? username,
    String? password,
    String? fromEmail,
    String? toEmail,
    bool? enabled,
    bool? notifyOnPrintFailure,
    bool? notifyOnPrinterOffline,
    bool? notifyOnJobStuck,
    bool? notifyOnAuthFailure,
  }) {
    return EmailConfig(
      id: id ?? this.id,
      smtpHost: smtpHost ?? this.smtpHost,
      smtpPort: smtpPort ?? this.smtpPort,
      useSsl: useSsl ?? this.useSsl,
      username: username ?? this.username,
      password: password ?? this.password,
      fromEmail: fromEmail ?? this.fromEmail,
      toEmail: toEmail ?? this.toEmail,
      enabled: enabled ?? this.enabled,
      notifyOnPrintFailure: notifyOnPrintFailure ?? this.notifyOnPrintFailure,
      notifyOnPrinterOffline:
          notifyOnPrinterOffline ?? this.notifyOnPrinterOffline,
      notifyOnJobStuck: notifyOnJobStuck ?? this.notifyOnJobStuck,
      notifyOnAuthFailure: notifyOnAuthFailure ?? this.notifyOnAuthFailure,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is EmailConfig && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'EmailConfig($smtpHost:$smtpPort, enabled=$enabled)';
}
