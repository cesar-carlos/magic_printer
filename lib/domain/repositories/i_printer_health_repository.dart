import 'package:result_dart/result_dart.dart';

import '../entities/printer_health.dart';

abstract class IPrinterHealthRepository {
  Future<Result<PrinterHealth>> getHealth(String printerId);

  Future<Result<List<PrinterHealth>>> getAllHealth();

  Future<Result<void>> updateHealth(PrinterHealth health);

  Future<Result<List<HealthTrend>>> getTrends(
    String printerId, {
    Duration? period,
  });

  Future<Result<void>> deleteOlderThan(DateTime date);
}
