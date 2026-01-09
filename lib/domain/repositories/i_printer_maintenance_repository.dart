import 'package:result_dart/result_dart.dart';

import '../entities/printer_maintenance.dart';

abstract class IPrinterMaintenanceRepository {
  Future<Result<List<PrinterMaintenance>>> getAll();

  Future<Result<List<PrinterMaintenance>>> getByPrinterId(String printerId);

  Future<Result<PrinterMaintenance>> getById(String id);

  Future<Result<PrinterMaintenance>> create(PrinterMaintenance maintenance);

  Future<Result<PrinterMaintenance>> update(PrinterMaintenance maintenance);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<PrinterMaintenance>>> getRecentMaintenance({
    String? printerId,
    int limit = 50,
  });

  Future<Result<List<PrinterMaintenance>>> getByType({
    required MaintenanceType type,
    String? printerId,
  });
}
