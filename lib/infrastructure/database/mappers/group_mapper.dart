import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class GroupMapper {
  static Group toEntity(GroupData data) {
    return Group(
      id: data.id,
      name: data.name,
      description: data.description,
      permissions: data.permissions.isEmpty ? [] : data.permissions.split(','),
      memberIds: data.memberIds.isEmpty ? [] : data.memberIds.split(','),
      createdAt: data.createdAt,
    );
  }

  static GroupsCompanion toCompanion(Group entity) {
    return GroupsCompanion.insert(
      id: entity.id,
      name: entity.name,
      description: Value(entity.description),
      permissions: Value(entity.permissions.join(',')),
      memberIds: Value(entity.memberIds.join(',')),
      createdAt: entity.createdAt,
      updatedAt: DateTime.now(),
    );
  }

  static GroupsCompanion toUpdateCompanion(Group entity) {
    return GroupsCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      description: Value(entity.description),
      permissions: Value(entity.permissions.join(',')),
      memberIds: Value(entity.memberIds.join(',')),
      updatedAt: Value(DateTime.now()),
    );
  }
}

