import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

class PrinterMaintenanceService {
  final IPrinterMaintenanceRepository _maintenanceRepository;

  PrinterMaintenanceService({
    required IPrinterMaintenanceRepository maintenanceRepository,
  }) : _maintenanceRepository = maintenanceRepository;

  Future<Result<List<PrinterMaintenance>>> getAllMaintenances() async {
    return await _maintenanceRepository.getAll();
  }

  Future<Result<List<PrinterMaintenance>>> getMaintenancesByPrinter(
    String printerId,
  ) async {
    return await _maintenanceRepository.getByPrinterId(printerId);
  }

  Future<Result<PrinterMaintenance>> getMaintenanceById(String id) async {
    return await _maintenanceRepository.getById(id);
  }

  Future<Result<PrinterMaintenance>> createMaintenance({
    required String printerId,
    required MaintenanceType type,
    String? description,
    String? performedBy,
    String? notes,
  }) async {
    const uuid = Uuid();
    final maintenance = PrinterMaintenance(
      id: uuid.v4(),
      printerId: printerId,
      type: type,
      description: description,
      performedBy: performedBy,
      performedAt: DateTime.now(),
      notes: notes,
    );

    return await _maintenanceRepository.create(maintenance);
  }

  Future<Result<PrinterMaintenance>> updateMaintenance(
    PrinterMaintenance maintenance,
  ) async {
    return await _maintenanceRepository.update(maintenance);
  }

  Future<Result<Unit>> deleteMaintenance(String id) async {
    return await _maintenanceRepository.delete(id);
  }

  Future<Result<List<PrinterMaintenance>>> getRecentMaintenances({
    String? printerId,
    int limit = 50,
  }) async {
    return await _maintenanceRepository.getRecentMaintenance(
      printerId: printerId,
      limit: limit,
    );
  }

  Future<Result<List<PrinterMaintenance>>> getMaintenancesByType({
    required MaintenanceType type,
    String? printerId,
  }) async {
    return await _maintenanceRepository.getByType(
      type: type,
      printerId: printerId,
    );
  }
}
