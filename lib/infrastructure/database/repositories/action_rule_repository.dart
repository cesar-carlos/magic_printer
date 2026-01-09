import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class ActionRuleRepository implements IActionRuleRepository {
  final AppDatabase _db;

  ActionRuleRepository(this._db);

  @override
  Future<Result<List<ActionRule>>> getAllRules() async {
    try {
      final data = await _db.select(_db.actionRulesTable).get();
      final rules = data.map(ActionRuleMapper.toEntity).toList();
      return Success(rules);
    } catch (e) {
      return StorageException.readFailed('action rules').toFailure();
    }
  }

  @override
  Future<Result<ActionRule>> getRule(String id) async {
    try {
      final data = await (_db.select(_db.actionRulesTable)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('action rule: $id').toFailure();
      }

      return Success(ActionRuleMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('action rule: $id').toFailure();
    }
  }

  @override
  Future<Result<void>> addRule(ActionRule rule) async {
    try {
      await _db
          .into(_db.actionRulesTable)
          .insert(ActionRuleMapper.toCompanion(rule));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('action rule: ${rule.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<void>> updateRule(ActionRule rule) async {
    try {
      await _db
          .update(_db.actionRulesTable)
          .replace(ActionRuleMapper.toUpdateCompanion(rule));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('action rule: ${rule.id}')
          .toFailure();
    }
  }

  @override
  Future<Result<void>> deleteRule(String id) async {
    try {
      final deleted = await (_db.delete(_db.actionRulesTable)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deleted == 0) {
        return StorageException.notFound('action rule: $id').toFailure();
      }

      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('action rule: $id').toFailure();
    }
  }

  @override
  Future<Result<void>> recordExecution(AutomatedAction action) async {
    try {
      await _db
          .into(_db.automatedActionsTable)
          .insert(AutomatedActionMapper.toCompanion(action));
      return const Success(unit);
    } catch (e) {
      return StorageException
          .writeFailed('automated action: ${action.id}')
          .toFailure();
    }
  }
}
