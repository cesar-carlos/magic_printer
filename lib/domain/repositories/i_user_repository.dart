import 'package:result_dart/result_dart.dart';

import '../entities/user.dart';

abstract class IUserRepository {
  Future<Result<List<User>>> getAll();

  Future<Result<User>> getById(String id);

  Future<Result<User>> getByUsername(String username);

  Future<Result<User>> create(User user);

  Future<Result<User>> update(User user);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<User>>> getByDepartment(String department);

  Future<Result<Unit>> updateLastSeen(String userId);
}
