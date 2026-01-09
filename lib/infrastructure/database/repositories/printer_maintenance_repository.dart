import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class PrinterMaintenanceRepository
    implements IPrinterMaintenanceRepository {
  final AppDatabase _db;

  PrinterMaintenanceRepository(this._db);

  @override
  Future<Result<List<PrinterMaintenance>>> getAll() async {
    try {
      final data = await _db.select(_db.printerMaintenances).get();
      final maintenances =
          data.map(PrinterMaintenanceMapper.toEntity).toList();
      return Success(maintenances);
    } catch (e) {
      return StorageException.readFailed('printer maintenances').toFailure();
    }
  }

  @override
  Future<Result<List<PrinterMaintenance>>> getByPrinterId(
    String printerId,
  ) async {
    try {
      final data = await (_db.select(_db.printerMaintenances)
            ..where((tbl) => tbl.printerId.equals(printerId))
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.performedAt,
                    mode: OrderingMode.desc,
                  )
            ]))
          .get();
      final maintenances =
          data.map(PrinterMaintenanceMapper.toEntity).toList();
      return Success(maintenances);
    } catch (e) {
      return StorageException
          .readFailed('printer maintenances for printer: $printerId')
          .toFailure();
    }
  }

  @override
  Future<Result<PrinterMaintenance>> getById(String id) async {
    try {
      final data = await (_db.select(_db.printerMaintenances)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('printer maintenance: $id')
            .toFailure();
      }

      return Success(PrinterMaintenanceMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('printer maintenance: $id')
          .toFailure();
    }
  }

  @override
  Future<Result<PrinterMaintenance>> create(
    PrinterMaintenance maintenance,
  ) async {
    try {
      await _db
          .into(_db.printerMaintenances)
          .insert(PrinterMaintenanceMapper.toCompanion(maintenance));
      return Success(maintenance);
    } catch (e) {
      return StorageException
          .writeFailed('printer maintenance: ${maintenance.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<PrinterMaintenance>> update(
    PrinterMaintenance maintenance,
  ) async {
    try {
      await _db
          .update(_db.printerMaintenances)
          .replace(PrinterMaintenanceMapper.toUpdateCompanion(maintenance));
      return Success(maintenance);
    } catch (e) {
      return StorageException
          .writeFailed('printer maintenance: ${maintenance.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      final deleted = await (_db.delete(_db.printerMaintenances)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deleted == 0) {
        return StorageException.notFound('printer maintenance: $id')
            .toFailure();
      }

      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('printer maintenance: $id')
          .toFailure();
    }
  }

  @override
  Future<Result<List<PrinterMaintenance>>> getRecentMaintenance({
    String? printerId,
    int limit = 50,
  }) async {
    try {
      var query = _db.select(_db.printerMaintenances)
        ..orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.performedAt,
                mode: OrderingMode.desc,
              )
        ])
        ..limit(limit);

      if (printerId != null) {
        query = query..where((tbl) => tbl.printerId.equals(printerId));
      }

      final data = await query.get();
      final maintenances =
          data.map(PrinterMaintenanceMapper.toEntity).toList();
      return Success(maintenances);
    } catch (e) {
      return StorageException.readFailed('recent printer maintenances')
          .toFailure();
    }
  }

  @override
  Future<Result<List<PrinterMaintenance>>> getByType({
    required MaintenanceType type,
    String? printerId,
  }) async {
    try {
      final typeString = _maintenanceTypeToString(type);
      var query = _db.select(_db.printerMaintenances)
        ..where((tbl) => tbl.maintenanceType.equals(typeString));

      if (printerId != null) {
        query = query..where((tbl) => tbl.printerId.equals(printerId));
      }

      final data = await query.get();
      final maintenances =
          data.map(PrinterMaintenanceMapper.toEntity).toList();
      return Success(maintenances);
    } catch (e) {
      return StorageException
          .readFailed('printer maintenances by type: $type')
          .toFailure();
    }
  }

  String _maintenanceTypeToString(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.cleaning:
        return 'cleaning';
      case MaintenanceType.tonerChange:
        return 'toner_change';
      case MaintenanceType.inkChange:
        return 'ink_change';
      case MaintenanceType.paperRefill:
        return 'paper_refill';
      case MaintenanceType.repair:
        return 'repair';
      case MaintenanceType.replacement:
        return 'replacement';
      case MaintenanceType.other:
        return 'other';
    }
  }
}
