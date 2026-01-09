import 'package:result_dart/result_dart.dart';

import '../entities/action_rule.dart';

abstract class IActionRuleRepository {
  Future<Result<List<ActionRule>>> getAllRules();

  Future<Result<ActionRule>> getRule(String id);

  Future<Result<void>> addRule(ActionRule rule);

  Future<Result<void>> updateRule(ActionRule rule);

  Future<Result<void>> deleteRule(String id);

  Future<Result<void>> recordExecution(AutomatedAction action);
}
