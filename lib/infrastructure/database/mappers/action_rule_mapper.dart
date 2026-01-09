import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class ActionRuleMapper {
  static ActionRule toEntity(ActionRuleData data) {
    return ActionRule(
      id: data.id,
      name: data.name,
      description: data.description,
      triggerType: TriggerType.values[data.triggerType],
      actionType: ActionType.values[data.actionType],
      conditions: _parseJson(data.conditions),
      enabled: data.enabled,
      lastExecuted: data.lastExecuted,
    );
  }

  static ActionRulesTableCompanion toCompanion(ActionRule entity) {
    return ActionRulesTableCompanion.insert(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      triggerType: entity.triggerType.index,
      actionType: entity.actionType.index,
      conditions: _toJson(entity.conditions),
      enabled: Value(entity.enabled),
      lastExecuted: Value(entity.lastExecuted),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static ActionRulesTableCompanion toUpdateCompanion(ActionRule entity) {
    return ActionRulesTableCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      description: Value(entity.description),
      triggerType: Value(entity.triggerType.index),
      actionType: Value(entity.actionType.index),
      conditions: Value(_toJson(entity.conditions)),
      enabled: Value(entity.enabled),
      lastExecuted: Value(entity.lastExecuted),
      updatedAt: Value(DateTime.now()),
    );
  }

  static Map<String, dynamic> _parseJson(String jsonString) {
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  static String _toJson(Map<String, dynamic> map) {
    try {
      return jsonEncode(map);
    } catch (e) {
      return '{}';
    }
  }
}
