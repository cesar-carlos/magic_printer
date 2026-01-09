enum TriggerType {
  healthLow,
  errorThreshold,
  queueSize,
  schedule,
  tonerLow,
  paperLow,
}

enum ActionType {
  pausePrinter,
  redirectJobs,
  clearQueue,
  restartService,
  sendAlert,
}

enum ActionResult {
  success,
  failed,
  skipped,
}

class ActionRule {
  final String id;
  final String name;
  final String description;
  final TriggerType triggerType;
  final ActionType actionType;
  final Map<String, dynamic> conditions;
  final bool enabled;
  final DateTime? lastExecuted;

  ActionRule({
    required this.id,
    required this.name,
    required this.description,
    required this.triggerType,
    required this.actionType,
    required this.conditions,
    this.enabled = true,
    this.lastExecuted,
  });

  ActionRule copyWith({
    String? id,
    String? name,
    String? description,
    TriggerType? triggerType,
    ActionType? actionType,
    Map<String, dynamic>? conditions,
    bool? enabled,
    DateTime? lastExecuted,
  }) {
    return ActionRule(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      triggerType: triggerType ?? this.triggerType,
      actionType: actionType ?? this.actionType,
      conditions: conditions ?? this.conditions,
      enabled: enabled ?? this.enabled,
      lastExecuted: lastExecuted ?? this.lastExecuted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ActionRule && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'ActionRule($id, $name, trigger: $triggerType, action: $actionType)';
}

class AutomatedAction {
  final String id;
  final String ruleId;
  final String printerId;
  final ActionType actionType;
  final Map<String, dynamic> parameters;
  final ActionResult result;
  final String? errorMessage;
  final DateTime executedAt;

  AutomatedAction({
    required this.id,
    required this.ruleId,
    required this.printerId,
    required this.actionType,
    required this.parameters,
    required this.result,
    this.errorMessage,
    required this.executedAt,
  });

  AutomatedAction copyWith({
    String? id,
    String? ruleId,
    String? printerId,
    ActionType? actionType,
    Map<String, dynamic>? parameters,
    ActionResult? result,
    String? errorMessage,
    DateTime? executedAt,
  }) {
    return AutomatedAction(
      id: id ?? this.id,
      ruleId: ruleId ?? this.ruleId,
      printerId: printerId ?? this.printerId,
      actionType: actionType ?? this.actionType,
      parameters: parameters ?? this.parameters,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
      executedAt: executedAt ?? this.executedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AutomatedAction && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'AutomatedAction($id, $actionType, result: $result, executedAt: $executedAt)';
}
