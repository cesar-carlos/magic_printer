enum AlertType {
  tonerLow,
  paperLow,
  highErrorRate,
  queueStuck,
  healthLow,
  printerOffline,
}

enum AlertSeverity {
  info,
  warning,
  error,
  critical,
}

enum AlertActionType {
  notification,
  email,
  webhook,
  pausePrinter,
  redirectJobs,
}

class AlertAction {
  final AlertActionType type;
  final Map<String, dynamic> parameters;

  AlertAction({
    required this.type,
    required this.parameters,
  });

  AlertAction copyWith({
    AlertActionType? type,
    Map<String, dynamic>? parameters,
  }) {
    return AlertAction(
      type: type ?? this.type,
      parameters: parameters ?? this.parameters,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertAction &&
          type == other.type &&
          parameters.toString() == other.parameters.toString();

  @override
  int get hashCode => type.hashCode ^ parameters.hashCode;

  @override
  String toString() => 'AlertAction($type, $parameters)';
}

class AlertRule {
  final String id;
  final String name;
  final String description;
  final AlertType type;
  final bool enabled;
  final AlertSeverity severity;
  final Map<String, dynamic> thresholds;
  final List<AlertAction> actions;
  final Duration? suppressionTime;

  AlertRule({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    this.enabled = true,
    required this.severity,
    required this.thresholds,
    required this.actions,
    this.suppressionTime,
  });

  AlertRule copyWith({
    String? id,
    String? name,
    String? description,
    AlertType? type,
    bool? enabled,
    AlertSeverity? severity,
    Map<String, dynamic>? thresholds,
    List<AlertAction>? actions,
    Duration? suppressionTime,
  }) {
    return AlertRule(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      enabled: enabled ?? this.enabled,
      severity: severity ?? this.severity,
      thresholds: thresholds ?? this.thresholds,
      actions: actions ?? this.actions,
      suppressionTime: suppressionTime ?? this.suppressionTime,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AlertRule && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'AlertRule($id, $name, $type, enabled: $enabled, severity: $severity)';
}

class Alert {
  final String id;
  final String ruleId;
  final String printerId;
  final AlertSeverity severity;
  final String title;
  final String message;
  final Map<String, dynamic> details;
  final DateTime createdAt;
  final bool acknowledged;

  Alert({
    required this.id,
    required this.ruleId,
    required this.printerId,
    required this.severity,
    required this.title,
    required this.message,
    required this.details,
    required this.createdAt,
    this.acknowledged = false,
  });

  Alert copyWith({
    String? id,
    String? ruleId,
    String? printerId,
    AlertSeverity? severity,
    String? title,
    String? message,
    Map<String, dynamic>? details,
    DateTime? createdAt,
    bool? acknowledged,
  }) {
    return Alert(
      id: id ?? this.id,
      ruleId: ruleId ?? this.ruleId,
      printerId: printerId ?? this.printerId,
      severity: severity ?? this.severity,
      title: title ?? this.title,
      message: message ?? this.message,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
      acknowledged: acknowledged ?? this.acknowledged,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Alert && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Alert($id, $title, severity: $severity)';
}
