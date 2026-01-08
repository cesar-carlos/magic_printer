import 'package:result_dart/result_dart.dart';

import '../entities/group.dart';

abstract class IGroupRepository {
  Future<Result<List<Group>>> getAll();

  Future<Result<Group>> getById(String id);

  Future<Result<Group>> getByName(String name);

  Future<Result<Group>> create(Group group);

  Future<Result<Group>> update(Group group);

  Future<Result<Unit>> delete(String id);

  Future<Result<bool>> hasPermission(
    String groupId,
    String permission,
  );

  Future<Result<List<String>>> getPermissionsForPrinter(
    String printerId,
    List<String> groupIds,
  );
}
