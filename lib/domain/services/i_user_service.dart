import 'package:result_dart/result_dart.dart';

import '../entities/user.dart';

abstract class IUserService {
  Future<Result<User>> getCurrentUser();

  Future<Result<List<User>>> getAllUsers();

  Future<Result<Unit>> syncWithWindowsUsers();

  Future<Result<User>> createOrUpdateUser({
    required String username,
    String? displayName,
    String? department,
    String? email,
  });
}
