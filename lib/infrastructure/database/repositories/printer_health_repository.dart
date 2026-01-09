import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class PrinterHealthRepository implements IPrinterHealthRepository {
  final AppDatabase _db;

  PrinterHealthRepository(this._db);

  @override
  Future<Result<PrinterHealth>> getHealth(String printerId) async {
    try {
      final data = await (_db.select(_db.printerHealthTable)
            ..where((tbl) => tbl.printerId.equals(printerId)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('printer health: $printerId')
            .toFailure();
      }

      final health = PrinterHealthMapper.toEntity(data);
      final trends = await _getTrends(printerId);
      return Success(health.copyWith(trends: trends));
    } catch (e) {
      return StorageException.readFailed('printer health: $printerId')
          .toFailure();
    }
  }

  @override
  Future<Result<List<PrinterHealth>>> getAllHealth() async {
    try {
      final data = await _db.select(_db.printerHealthTable).get();
      final healthList = <PrinterHealth>[];

      for (final healthData in data) {
        final health = PrinterHealthMapper.toEntity(healthData);
        final trends = await _getTrends(healthData.printerId);
        healthList.add(health.copyWith(trends: trends));
      }

      return Success(healthList);
    } catch (e) {
      return StorageException.readFailed('printer health').toFailure();
    }
  }

  @override
  Future<Result<void>> updateHealth(PrinterHealth health) async {
    try {
      final existing = await (_db.select(_db.printerHealthTable)
            ..where((tbl) => tbl.printerId.equals(health.printerId)))
          .getSingleOrNull();

      if (existing == null) {
        await _db
            .into(_db.printerHealthTable)
            .insert(PrinterHealthMapper.toCompanion(health));
      } else {
        await _db
            .update(_db.printerHealthTable)
            .replace(PrinterHealthMapper.toUpdateCompanion(health));
      }

      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('printer health: ${health.printerId}')
          .toFailure();
    }
  }

  @override
  Future<Result<List<HealthTrend>>> getTrends(
    String printerId, {
    Duration? period,
  }) async {
    try {
      final cutoffDate = period != null
          ? DateTime.now().subtract(period)
          : DateTime.now().subtract(const Duration(days: 30));

      final data = await (_db.select(_db.printerHealthTable)
            ..where((tbl) =>
                tbl.printerId.equals(printerId) &
                tbl.lastCheck.isBiggerOrEqualValue(cutoffDate))
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.lastCheck,
                    mode: OrderingMode.asc,
                  )
            ]))
          .get();

      final trends = data
          .map((d) => HealthTrend(
                timestamp: d.lastCheck,
                score: d.healthScore,
              ))
          .toList();

      return Success(trends);
    } catch (e) {
      return StorageException
          .readFailed('printer health trends: $printerId')
          .toFailure();
    }
  }

  @override
  Future<Result<void>> deleteOlderThan(DateTime date) async {
    try {
      await (_db.delete(_db.printerHealthTable)
            ..where((tbl) => tbl.lastCheck.isSmallerThanValue(date)))
          .go();
      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('printer health cleanup').toFailure();
    }
  }

  Future<List<HealthTrend>> _getTrends(String printerId) async {
    try {
      final cutoffDate = DateTime.now().subtract(const Duration(days: 30));

      final data = await (_db.select(_db.printerHealthTable)
            ..where((tbl) =>
                tbl.printerId.equals(printerId) &
                tbl.lastCheck.isBiggerOrEqualValue(cutoffDate))
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.lastCheck,
                    mode: OrderingMode.asc,
                  )
            ]))
          .get();

      return data
          .map((d) => HealthTrend(
                timestamp: d.lastCheck,
                score: d.healthScore,
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
