import '../../../domain/domain.dart';
import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../grpc/client/host_discovery_client.dart';
import '../app_database.dart';
import '../mappers/mappers.dart';

class HostRepository implements IHostRepository {
  final AppDatabase _db;

  HostRepository(this._db);

  @override
  Future<Result<List<Host>>> getAll() async {
    try {
      final data = await _db.select(_db.hosts).get();
      final hosts = data.map(HostMapper.toEntity).toList();
      return Success(hosts);
    } catch (e) {
      return StorageException.readFailed('hosts').toFailure();
    }
  }

  @override
  Future<Result<Host>> getById(String id) async {
    try {
      final data = await (_db.select(_db.hosts)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('host: $id').toFailure();
      }

      return Success(HostMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('host: $id').toFailure();
    }
  }

  @override
  Future<Result<Host>> getByAddress(HostAddress address) async {
    try {
      final data = await (_db.select(_db.hosts)
            ..where((tbl) =>
                tbl.host.equals(address.host) & tbl.port.equals(address.port)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound(
          'host: ${address.fullAddress}',
        ).toFailure();
      }

      return Success(HostMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed(
        'host: ${address.fullAddress}',
      ).toFailure();
    }
  }

  @override
  Future<Result<Host>> add(Host host) async {
    try {
      await _db.into(_db.hosts).insert(HostMapper.toCompanion(host));
      return Success(host);
    } catch (e) {
      return StorageException.writeFailed('host: ${host.id}').toFailure();
    }
  }

  @override
  Future<Result<Host>> update(Host host) async {
    try {
      await _db.update(_db.hosts).replace(HostMapper.toCompanion(host));
      return Success(host);
    } catch (e) {
      return StorageException.writeFailed('host: ${host.id}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      await (_db.delete(_db.hosts)..where((tbl) => tbl.id.equals(id))).go();
      return Success(unit);
    } catch (e) {
      return StorageException.writeFailed('host: $id').toFailure();
    }
  }

  @override
  Future<Result<Host>> connect(String hostId) async {
    final hostResult = await getById(hostId);
    if (hostResult.isError()) {
      return hostResult;
    }

    final host = hostResult.getOrThrow();
    final config = HostDiscoveryConfig(
      hostAddress: host.address.host,
      hostPort: host.address.port,
    );
    final client = HostDiscoveryClient(
      config: config,
      clientId: 'magic_printer',
    );

    try {
      final info = await client.getHostInfo();
      if (info == null) {
        final updated = host.copyWith(status: HostStatus.offline);
        return update(updated);
      }

      final updatedHost = host.copyWith(
        name: info.hostName.isNotEmpty ? info.hostName : host.name,
        status: HostStatus.online,
        requiresAuth: info.requiresAuth,
        supportedFeatures: info.supportedFeatures,
        version: info.version.isNotEmpty ? info.version : null,
        lastSeen: DateTime.now(),
      );

      return update(updatedHost);
    } finally {
      await client.close();
    }
  }

  @override
  Future<Result<Unit>> disconnect(String hostId) async {
    final hostResult = await getById(hostId);
    if (hostResult.isError()) {
      return hostResult.exceptionOrNull()!.toFailure();
    }

    final host = hostResult.getOrThrow();
    final updatedHost = host.copyWith(status: HostStatus.offline);

    final updateResult = await update(updatedHost);
    if (updateResult.isError()) {
      return updateResult.exceptionOrNull()!.toFailure();
    }

    return Success(unit);
  }

  @override
  Future<Result<Token>> authenticate(
    String hostId,
    String username,
    String password,
  ) async {
    final hostResult = await getById(hostId);
    if (hostResult.isError()) {
      return hostResult.exceptionOrNull()!.toFailure();
    }

    final host = hostResult.getOrThrow();

    // Proto atual usa authToken (string). Aqui tratamos password como token.
    Token token;
    try {
      token = Token(
        value: password,
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
      );
    } on ValidationException catch (e) {
      return e.toFailure();
    }

    final config = HostDiscoveryConfig(
      hostAddress: host.address.host,
      hostPort: host.address.port,
    );
    final client = HostDiscoveryClient(
      config: config,
      clientId: 'magic_printer',
    );

    try {
      final response = await client.listPrinters(token.value);
      if (!response.success) {
        return AuthException.invalidToken().toFailure();
      }

      final updatedHost = host.copyWith(token: token);
      await update(updatedHost);
      return Success(token);
    } finally {
      await client.close();
    }
  }

  @override
  Future<Result<Host>> refreshHostInfo(String hostId) async {
    final hostResult = await getById(hostId);
    if (hostResult.isError()) {
      return hostResult;
    }

    final host = hostResult.getOrThrow();
    final config = HostDiscoveryConfig(
      hostAddress: host.address.host,
      hostPort: host.address.port,
    );
    final client = HostDiscoveryClient(
      config: config,
      clientId: 'magic_printer',
    );

    try {
      final info = await client.getHostInfo();
      if (info == null) {
        final updated = host.copyWith(status: HostStatus.offline);
        return update(updated);
      }

      final updatedHost = host.copyWith(
        name: info.hostName.isNotEmpty ? info.hostName : host.name,
        status: HostStatus.online,
        requiresAuth: info.requiresAuth,
        supportedFeatures: info.supportedFeatures,
        version: info.version.isNotEmpty ? info.version : null,
        lastSeen: DateTime.now(),
      );

      return update(updatedHost);
    } finally {
      await client.close();
    }
  }
}

