import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class UserRepository implements IUserRepository {
  final AppDatabase _db;

  UserRepository(this._db);

  @override
  Future<Result<List<User>>> getAll() async {
    try {
      final data = await _db.select(_db.users).get();
      final users = data.map(UserMapper.toEntity).toList();
      return Success(users);
    } catch (e) {
      return StorageException.readFailed('users').toFailure();
    }
  }

  @override
  Future<Result<User>> getById(String id) async {
    try {
      final data = await (_db.select(_db.users)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('user: $id').toFailure();
      }

      return Success(UserMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('user: $id').toFailure();
    }
  }

  @override
  Future<Result<User>> getByUsername(String username) async {
    try {
      final data = await (_db.select(_db.users)
            ..where((tbl) => tbl.username.equals(username)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('user: $username').toFailure();
      }

      return Success(UserMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('user: $username').toFailure();
    }
  }

  @override
  Future<Result<User>> create(User user) async {
    try {
      await _db.into(_db.users).insert(UserMapper.toCompanion(user));
      return Success(user);
    } catch (e) {
      return StorageException.writeFailed('user: ${user.id}').toFailure();
    }
  }

  @override
  Future<Result<User>> update(User user) async {
    try {
      await _db
          .update(_db.users)
          .replace(UserMapper.toUpdateCompanion(user));
      return Success(user);
    } catch (e) {
      return StorageException.writeFailed('user: ${user.id}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      final deleted = await (_db.delete(_db.users)
            ..where((tbl) => tbl.id.equals(id)))
          .go();

      if (deleted == 0) {
        return StorageException.notFound('user: $id').toFailure();
      }

      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('user: $id').toFailure();
    }
  }

  @override
  Future<Result<List<User>>> getByDepartment(String department) async {
    try {
      final data = await (_db.select(_db.users)
            ..where((tbl) => tbl.department.equals(department)))
          .get();
      final users = data.map(UserMapper.toEntity).toList();
      return Success(users);
    } catch (e) {
      return StorageException.readFailed('users by department: $department')
          .toFailure();
    }
  }

  @override
  Future<Result<Unit>> updateLastSeen(String userId) async {
    try {
      await (_db.update(_db.users)..where((tbl) => tbl.id.equals(userId)))
          .write(UsersCompanion(lastSeen: Value(DateTime.now())));
      return const Success(unit);
    } catch (e) {
      return StorageException.writeFailed('user lastSeen: $userId').toFailure();
    }
  }
}
