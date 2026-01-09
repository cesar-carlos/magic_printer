import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class AutomatedActionMapper {
  static AutomatedAction toEntity(AutomatedActionData data) {
    return AutomatedAction(
      id: data.id,
      ruleId: data.ruleId,
      printerId: data.printerId,
      actionType: ActionType.values[data.actionType],
      parameters: _parseJson(data.parameters),
      result: ActionResult.values[data.result],
      errorMessage: data.errorMessage,
      executedAt: data.executedAt,
    );
  }

  static AutomatedActionsTableCompanion toCompanion(AutomatedAction entity) {
    return AutomatedActionsTableCompanion.insert(
      id: entity.id,
      ruleId: entity.ruleId,
      printerId: entity.printerId,
      actionType: entity.actionType.index,
      parameters: _toJson(entity.parameters),
      result: entity.result.index,
      errorMessage: Value(entity.errorMessage),
      executedAt: entity.executedAt,
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
