import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../entities/printer_health.dart';

abstract class IHealthMonitorService {
  Future<Result<PrinterHealth>> calculateHealth(String printerId);

  Future<Result<List<PrinterHealth>>> calculateAllHealth();

  Stream<PrinterHealth> watchHealth(String printerId);

  bool get isEnabled;

  void setEnabled(bool enabled);
}
