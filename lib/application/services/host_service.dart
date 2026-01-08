import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../dtos/add_host_request_dto.dart';
import '../dtos/connect_host_request_dto.dart';
import '../dtos/host_dto.dart';
import '../mappers/host_mapper.dart';

class HostService {
  final AddHost _addHost;
  final ConnectToHost _connectToHost;
  final IHostRepository _hostRepository;

  HostService({
    required AddHost addHost,
    required ConnectToHost connectToHost,
    required IHostRepository hostRepository,
  })  : _addHost = addHost,
        _connectToHost = connectToHost,
        _hostRepository = hostRepository;

  Future<Result<HostDTO>> addHost(AddHostRequestDTO request) async {
    final params = AddHostParams(
      name: request.name,
      host: request.host,
      port: request.port,
    );

    final result = await _addHost.call(params);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<HostDTO>> connectHost(ConnectHostRequestDTO request) async {
    final result = request.username != null && request.password != null
        ? await _connectToHost.authenticateAndConnect(
            hostId: request.hostId,
            username: request.username!,
            password: request.password!,
          )
        : await _connectToHost.call(request.hostId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<List<HostDTO>>> getAllHosts() async {
    final result = await _hostRepository.getAll();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<HostDTO>> getHostById(String hostId) async {
    final result = await _hostRepository.getById(hostId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<HostDTO>> getHostByAddress(HostAddress address) async {
    final result = await _hostRepository.getByAddress(address);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<HostDTO>> refreshHost(String hostId) async {
    final result = await _hostRepository.refreshHostInfo(hostId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(HostMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<void>> deleteHost(String hostId) async {
    return await _hostRepository.delete(hostId);
  }
}

