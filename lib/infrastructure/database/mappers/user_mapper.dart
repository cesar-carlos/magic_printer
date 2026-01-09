import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class UserMapper {
  static User toEntity(UserData data) {
    return User(
      id: data.id,
      username: data.username,
      displayName: data.displayName,
      department: data.department,
      email: data.email,
      groupIds: data.groupIds.isEmpty ? [] : data.groupIds.split(','),
      createdAt: data.createdAt,
      lastSeen: data.lastSeen,
    );
  }

  static UsersCompanion toCompanion(User entity) {
    return UsersCompanion.insert(
      id: entity.id,
      username: entity.username,
      displayName: Value(entity.displayName),
      department: Value(entity.department),
      email: Value(entity.email),
      groupIds: Value(entity.groupIds.join(',')),
      createdAt: entity.createdAt,
      lastSeen: Value(entity.lastSeen),
    );
  }

  static UsersCompanion toUpdateCompanion(User entity) {
    return UsersCompanion(
      id: Value(entity.id),
      username: Value(entity.username),
      displayName: Value(entity.displayName),
      department: Value(entity.department),
      email: Value(entity.email),
      groupIds: Value(entity.groupIds.join(',')),
      lastSeen: Value(entity.lastSeen),
    );
  }
}
