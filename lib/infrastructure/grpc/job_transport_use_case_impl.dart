import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';
import 'client/job_transport_client.dart';

class JobTransportUseCaseImpl implements IJobTransportUseCase {
  final Map<String, JobTransportClient> _clients = {};
  final IHostRepository _hostRepository;
  final Logger _logger;

  JobTransportUseCaseImpl({
    required IHostRepository hostRepository,
    required Logger logger,
  }) : _hostRepository = hostRepository,
       _logger = logger;

  Future<JobTransportClient> _getClient(String hostId) async {
    if (_clients.containsKey(hostId)) {
      return _clients[hostId]!;
    }

    final hostResult = await _hostRepository.getById(hostId);
    if (hostResult.isError()) {
      throw Exception('Host não encontrado: $hostId');
    }

    final host = hostResult.getOrThrow();
    if (!host.isOnline || host.token == null) {
      throw Exception('Host não está online ou não autenticado');
    }

    final config = JobTransportConfig(
      hostAddress: host.address.host,
      hostPort: host.address.port,
      chunkSize: 64 * 1024,
      maxRetries: 3,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 30),
    );

    final client = JobTransportClient(
      config: config,
      clientId: const Uuid().v4(),
    );

    _clients[hostId] = client;
    return client;
  }

  @override
  Future<Result<Unit>> send({
    required String hostId,
    required String printerName,
    required String documentName,
    required Uint8List payload,
    required String token,
    int totalPages = 0,
    String datatype = 'RAW',
    void Function(int sent, int total)? onProgress,
  }) async {
    try {
      final client = await _getClient(hostId);

      final result = await client.sendJob(
        printerName: printerName,
        payload: payload,
        documentName: documentName,
        authToken: token,
        compress: true,
        totalPages: totalPages,
        datatype: datatype,
        onProgress: onProgress,
      );

      if (!result.success) {
        return Failure(
          NetworkException(
            'E_SEND_FAILED',
            result.errorMessage ?? 'Falha ao enviar job',
          ),
        );
      }

      return const Success(unit);
    } catch (e) {
      _logger.e('Erro ao enviar job via gRPC', error: e);
      return Failure(NetworkException('E_TRANSPORT_ERROR', e.toString()));
    }
  }

  Future<void> closeClient(String hostId) async {
    final client = _clients.remove(hostId);
    if (client != null) {
      await client.close();
    }
  }

  Future<void> closeAllClients() async {
    for (final client in _clients.values) {
      await client.close();
    }
    _clients.clear();
  }
}
