import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../entities/alert_rule.dart';

abstract class IAlertRuleService {
  Future<Result<List<AlertRule>>> getAllRules();

  Future<Result<AlertRule>> getRule(String id);

  Future<Result<void>> addRule(AlertRule rule);

  Future<Result<void>> updateRule(AlertRule rule);

  Future<Result<void>> deleteRule(String id);

  Future<Result<List<Alert>>> evaluateRules(String printerId);

  Stream<List<Alert>> watchAlerts(String printerId);

  void setEnabled(bool enabled);
}
