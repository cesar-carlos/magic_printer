import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class PrinterSupplyRepository implements IPrinterSupplyRepository {
  final AppDatabase _db;

  PrinterSupplyRepository(this._db);

  @override
  Future<Result<List<PrinterSupply>>> getAll() async {
    try {
      final data = await _db.select(_db.printerSupplies).get();
      final supplies = data.map(PrinterSupplyMapper.toEntity).toList();
      return Success(supplies);
    } catch (e) {
      return StorageException.readFailed('printer supplies').toFailure();
    }
  }

  @override
  Future<Result<List<PrinterSupply>>> getByPrinterId(String printerId) async {
    try {
      final data = await (_db.select(_db.printerSupplies)
            ..where((tbl) => tbl.printerId.equals(printerId)))
          .get();
      final supplies = data.map(PrinterSupplyMapper.toEntity).toList();
      return Success(supplies);
    } catch (e) {
      return StorageException
          .readFailed('printer supplies for printer: $printerId')
          .toFailure();
    }
  }

  @override
  Future<Result<PrinterSupply>> getById(String id) async {
    try {
      final data = await (_db.select(_db.printerSupplies)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('printer supply: $id').toFailure();
      }

      return Success(PrinterSupplyMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('printer supply: $id').toFailure();
    }
  }

  @override
  Future<Result<PrinterSupply>> create(PrinterSupply supply) async {
    try {
      await _db
          .into(_db.printerSupplies)
          .insert(PrinterSupplyMapper.toCompanion(supply));
      return Success(supply);
    } catch (e) {
      return StorageException.writeFailed('printer supply: ${supply.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<PrinterSupply>> update(PrinterSupply supply) async {
    try {
      await _db
          .update(_db.printerSupplies)
          .replace(PrinterSupplyMapper.toUpdateCompanion(supply));
      return Success(supply);
    } catch (e) {
      return StorageException.writeFailed('printer supply: ${supply.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      final deleted = await (_db.delete(_db.printerSupplies)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deleted == 0) {
        return StorageException.notFound('printer supply: $id').toFailure();
      }

      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('printer supply: $id').toFailure();
    }
  }

  @override
  Future<Result<List<PrinterSupply>>> getLowSupplies({
    int threshold = 20,
  }) async {
    try {
      final data = await (_db.select(_db.printerSupplies)
            ..where((tbl) => tbl.level.isSmallerThanValue(threshold)))
          .get();
      final supplies = data.map(PrinterSupplyMapper.toEntity).toList();
      return Success(supplies);
    } catch (e) {
      return StorageException
          .readFailed('low printer supplies (threshold: $threshold)')
          .toFailure();
    }
  }

  @override
  Future<Result<List<PrinterSupply>>> getCriticalSupplies({
    int threshold = 10,
  }) async {
    try {
      final data = await (_db.select(_db.printerSupplies)
            ..where((tbl) => tbl.level.isSmallerThanValue(threshold)))
          .get();
      final supplies = data.map(PrinterSupplyMapper.toEntity).toList();
      return Success(supplies);
    } catch (e) {
      return StorageException
          .readFailed('critical printer supplies (threshold: $threshold)')
          .toFailure();
    }
  }
}
