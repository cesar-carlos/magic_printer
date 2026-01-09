import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../entities/action_rule.dart';

abstract class IActionExecutorService {
  Future<Result<List<AutomatedAction>>> evaluateAndExecute(String printerId);

  Future<Result<AutomatedAction>> executeRule(ActionRule rule, String printerId);

  Stream<AutomatedAction> watchActions(String printerId);

  bool get isEnabled;

  void setEnabled(bool enabled);
}
