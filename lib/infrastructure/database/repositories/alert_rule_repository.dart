import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class AlertRuleRepository {
  final AppDatabase _db;

  AlertRuleRepository(this._db);

  Future<Result<List<AlertRule>>> getAll() async {
    try {
      final data = await _db.select(_db.alertRulesTable).get();
      final rules = data.map(AlertRuleMapper.toEntity).toList();
      return Success(rules);
    } catch (e) {
      return StorageException.readFailed('alert rules').toFailure();
    }
  }

  Future<Result<AlertRule>> getById(String id) async {
    try {
      final data = await (_db.select(_db.alertRulesTable)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('alert rule: $id').toFailure();
      }

      return Success(AlertRuleMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('alert rule: $id').toFailure();
    }
  }

  Future<Result<void>> add(AlertRule rule) async {
    try {
      await _db
          .into(_db.alertRulesTable)
          .insert(AlertRuleMapper.toCompanion(rule));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('alert rule: ${rule.id}')
          .toFailure();
    }
  }

  Future<Result<void>> update(AlertRule rule) async {
    try {
      await _db
          .update(_db.alertRulesTable)
          .replace(AlertRuleMapper.toUpdateCompanion(rule));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('alert rule: ${rule.id}')
          .toFailure();
    }
  }

  Future<Result<void>> delete(String id) async {
    try {
      final deleted = await (_db.delete(_db.alertRulesTable)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deleted == 0) {
        return StorageException.notFound('alert rule: $id').toFailure();
      }

      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('alert rule: $id').toFailure();
    }
  }
}
