import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class HostMapper {
  static Host toEntity(HostData data) {
    return Host(
      id: data.id,
      name: data.name,
      address: HostAddress(host: data.host, port: data.port),
      status: HostStatus.values[data.status],
      requiresAuth: data.requiresAuth,
      token: data.token != null && data.token!.isNotEmpty
          ? Token(value: data.token!, expiresAt: data.tokenExpiresAt)
          : null,
      lastSeen: data.lastSeen,
      supportedFeatures:
          data.supportedFeatures.isEmpty ? [] : data.supportedFeatures.split(','),
      version: data.version,
    );
  }

  static HostsCompanion toCompanion(Host entity) {
    return HostsCompanion.insert(
      id: entity.id,
      name: entity.name,
      host: entity.address.host,
      port: entity.address.port,
      status: entity.status.index,
      requiresAuth: Value(entity.requiresAuth),
      token: Value(entity.token?.value),
      tokenExpiresAt: Value(entity.token?.expiresAt),
      lastSeen: Value(entity.lastSeen),
      supportedFeatures: Value(entity.supportedFeatures.join(',')),
      version: Value(entity.version),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static HostsCompanion toUpdateCompanion(Host entity) {
    return HostsCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      host: Value(entity.address.host),
      port: Value(entity.address.port),
      status: Value(entity.status.index),
      requiresAuth: Value(entity.requiresAuth),
      token: Value(entity.token?.value),
      tokenExpiresAt: Value(entity.token?.expiresAt),
      lastSeen: Value(entity.lastSeen),
      supportedFeatures: Value(entity.supportedFeatures.join(',')),
      version: Value(entity.version),
      updatedAt: Value(DateTime.now()),
    );
  }
}

