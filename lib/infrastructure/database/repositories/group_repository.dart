import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';

import '../app_database.dart';
import '../mappers/mappers.dart';

class GroupRepository implements IGroupRepository {
  final AppDatabase _db;

  GroupRepository(this._db);

  @override
  Future<Result<List<Group>>> getAll() async {
    try {
      final data = await _db.select(_db.groups).get();
      final groups = data.map(GroupMapper.toEntity).toList();
      return Success(groups);
    } catch (e) {
      return StorageException.readFailed('groups').toFailure();
    }
  }

  @override
  Future<Result<Group>> getById(String id) async {
    try {
      final data = await (_db.select(_db.groups)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('group: $id').toFailure();
      }

      return Success(GroupMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('group: $id').toFailure();
    }
  }

  @override
  Future<Result<Group>> getByName(String name) async {
    try {
      final data = await (_db.select(_db.groups)
            ..where((tbl) => tbl.name.equals(name)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('group: $name').toFailure();
      }

      return Success(GroupMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('group: $name').toFailure();
    }
  }

  @override
  Future<Result<Group>> create(Group group) async {
    try {
      await _db.into(_db.groups).insert(GroupMapper.toCompanion(group));
      return Success(group);
    } catch (e) {
      return StorageException.writeFailed('group: ${group.id}').toFailure();
    }
  }

  @override
  Future<Result<Group>> update(Group group) async {
    try {
      await _db.update(_db.groups).replace(GroupMapper.toCompanion(group));
      return Success(group);
    } catch (e) {
      return StorageException.writeFailed('group: ${group.id}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      await (_db.delete(_db.groups)..where((tbl) => tbl.id.equals(id))).go();
      return Success(unit);
    } catch (e) {
      return StorageException.writeFailed('group: $id').toFailure();
    }
  }

  @override
  Future<Result<bool>> hasPermission(
    String groupId,
    String permission,
  ) async {
    final groupResult = await getById(groupId);

    if (groupResult.isError()) {
      return groupResult.exceptionOrNull()!.toFailure();
    }

    final group = groupResult.getOrThrow();
    return Success(group.hasPermission(permission));
  }

  @override
  Future<Result<List<String>>> getPermissionsForPrinter(
    String printerId,
    List<String> groupIds,
  ) async {
    try {
      final allPermissions = <String>{};

      for (final groupId in groupIds) {
        final groupResult = await getById(groupId);
        if (groupResult.isSuccess()) {
          final group = groupResult.getOrThrow();
          allPermissions.addAll(group.permissions);
        }
      }

      return Success(allPermissions.toList());
    } catch (e) {
      return StorageException.readFailed(
        'permissions for printer: $printerId',
      ).toFailure();
    }
  }
}

