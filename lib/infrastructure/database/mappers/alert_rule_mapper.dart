import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class AlertRuleMapper {
  static AlertRule toEntity(AlertRuleData data) {
    return AlertRule(
      id: data.id,
      name: data.name,
      description: data.description,
      type: AlertType.values[data.type],
      enabled: data.enabled,
      severity: AlertSeverity.values[data.severity],
      thresholds: _parseJson(data.thresholds),
      actions: _parseActions(data.actions),
      suppressionTime: data.suppressionTimeMinutes != null
          ? Duration(minutes: data.suppressionTimeMinutes!)
          : null,
    );
  }

  static AlertRulesTableCompanion toCompanion(AlertRule entity) {
    return AlertRulesTableCompanion.insert(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      type: entity.type.index,
      enabled: Value(entity.enabled),
      severity: entity.severity.index,
      thresholds: _toJson(entity.thresholds),
      actions: _toActionsJson(entity.actions),
      suppressionTimeMinutes: Value(entity.suppressionTime?.inMinutes),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static AlertRulesTableCompanion toUpdateCompanion(AlertRule entity) {
    return AlertRulesTableCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      description: Value(entity.description),
      type: Value(entity.type.index),
      enabled: Value(entity.enabled),
      severity: Value(entity.severity.index),
      thresholds: Value(_toJson(entity.thresholds)),
      actions: Value(_toActionsJson(entity.actions)),
      suppressionTimeMinutes: Value(entity.suppressionTime?.inMinutes),
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

  static List<AlertAction> _parseActions(String jsonString) {
    try {
      final List<dynamic> list = jsonDecode(jsonString) as List<dynamic>;
      return list
          .map((item) => AlertAction(
                type: AlertActionType.values[item['type'] as int],
                parameters: Map<String, dynamic>.from(item['parameters'] as Map),
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }

  static String _toActionsJson(List<AlertAction> actions) {
    try {
      final list = actions
          .map((action) => {
                'type': action.type.index,
                'parameters': action.parameters,
              })
          .toList();
      return jsonEncode(list);
    } catch (e) {
      return '[]';
    }
  }
}
