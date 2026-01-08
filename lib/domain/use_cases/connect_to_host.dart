import 'package:result_dart/result_dart.dart';

import '../entities/host.dart';
import '../errors/failures.dart';
import '../repositories/i_host_repository.dart';

class ConnectToHost {
  final IHostRepository _hostRepository;

  ConnectToHost({required IHostRepository hostRepository})
      : _hostRepository = hostRepository;

  Future<Result<Host>> call(String hostId) async {
    final connectResult = await _hostRepository.connect(hostId);

    if (connectResult.isError()) {
      return connectResult.exceptionOrNull()!.toFailure();
    }

    final host = connectResult.getOrThrow();

    if (!host.isOnline) {
      return NetworkException.hostOffline(host.name).toFailure();
    }

    return _hostRepository.refreshHostInfo(hostId);
  }

  Future<Result<Host>> authenticateAndConnect({
    required String hostId,
    required String username,
    required String password,
  }) async {
    final connectResult = await call(hostId);

    if (connectResult.isError()) {
      return connectResult.exceptionOrNull()!.toFailure();
    }

    final host = connectResult.getOrThrow();

    if (!host.requiresAuth) {
      return Success(host);
    }

    final authResult = await _hostRepository.authenticate(
      hostId,
      username,
      password,
    );

    if (authResult.isError()) {
      return authResult.exceptionOrNull()!.toFailure();
    }

    final token = authResult.getOrThrow();
    final updatedHost = host.copyWith(token: token);

    return _hostRepository.update(updatedHost);
  }
}
