import 'dart:async';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

import '../generated/generated.dart' as pb;
import '../../datasources/windows/windows.dart';

class JobTransportConfig {
  final String hostAddress;
  final int hostPort;
  final Duration connectTimeout;
  final Duration sendTimeout;
  final int maxRetries;
  final Duration retryDelay;
  final int chunkSize;

  const JobTransportConfig({
    required this.hostAddress,
    required this.hostPort,
    this.connectTimeout = const Duration(seconds: 10),
    this.sendTimeout = const Duration(seconds: 60),
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
    this.chunkSize = 65536,
  });
}

class SendJobResult {
  final bool success;
  final String? errorCode;
  final String? errorMessage;
  final String jobId;
  final int chunksSent;
  final int totalChunks;
  final Duration duration;
  final pb.JobResult? result;

  const SendJobResult({
    required this.success,
    this.errorCode,
    this.errorMessage,
    required this.jobId,
    required this.chunksSent,
    required this.totalChunks,
    required this.duration,
    this.result,
  });

  factory SendJobResult.failure({
    required String jobId,
    required String errorCode,
    required String errorMessage,
    required int chunksSent,
    required int totalChunks,
    required Duration duration,
  }) => SendJobResult(
    success: false,
    errorCode: errorCode,
    errorMessage: errorMessage,
    jobId: jobId,
    chunksSent: chunksSent,
    totalChunks: totalChunks,
    duration: duration,
  );

  @override
  String toString() {
    final buffer = StringBuffer('SendJobResult:\n');
    buffer.writeln('  success: $success');
    buffer.writeln('  jobId: $jobId');
    buffer.writeln('  chunks: $chunksSent/$totalChunks');
    buffer.writeln('  duration: ${duration.inMilliseconds}ms');
    if (errorCode != null) {
      buffer.writeln('  error: $errorCode - $errorMessage');
    }
    return buffer.toString();
  }
}

abstract class IJobTransportClient {
  Future<SendJobResult> sendJob({
    required String printerName,
    required Uint8List payload,
    required String documentName,
    String? authToken,
    bool compress,
    void Function(int sent, int total)? onProgress,
  });

  Future<pb.GetJobStatusResponse> getJobStatus(String jobId);
  Future<pb.CancelJobResponse> cancelJob(String jobId, {String? reason});
  Future<void> close();
}

class JobTransportClient implements IJobTransportClient {
  final JobTransportConfig config;
  final JobCompressor _compressor;
  final PayloadChunker _chunker;
  final Logger _logger;
  final String clientId;

  grpc.ClientChannel? _channel;
  pb.JobTransportClient? _stub;

  JobTransportClient({
    required this.config,
    required this.clientId,
    JobCompressor? compressor,
    PayloadChunker? chunker,
    Logger? logger,
  }) : _compressor = compressor ?? JobCompressor(),
       _chunker = chunker ?? PayloadChunker(chunkSize: config.chunkSize),
       _logger = logger ?? Logger() {
    _initializeChannel();
  }

  void _initializeChannel() {
    _channel = grpc.ClientChannel(
      config.hostAddress,
      port: config.hostPort,
      options: const grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
      ),
    );
    _stub = pb.JobTransportClient(_channel!);
  }

  @override
  Future<SendJobResult> sendJob({
    required String printerName,
    required Uint8List payload,
    required String documentName,
    String? authToken,
    bool compress = true,
    int totalPages = 0,
    String datatype = 'RAW',
    void Function(int sent, int total)? onProgress,
  }) async {
    final startTime = DateTime.now();
    final jobId = const Uuid().v4();

    _logger.i('Iniciando envio de job: $jobId');
    _logger.d('Impressora: $printerName');
    _logger.d('Tamanho original: ${payload.length} bytes');

    final Uint8List finalPayload;
    final int originalSize = payload.length;
    final String compressionType;

    if (compress) {
      finalPayload = _compressor.compress(payload);
      compressionType = 'gzip';
      _logger.d('Tamanho comprimido: ${finalPayload.length} bytes');
    } else {
      finalPayload = payload;
      compressionType = 'none';
    }

    final chunks = _chunker.chunk(finalPayload);
    final totalChunks = chunks.length;

    _logger.d('Total de chunks: $totalChunks');

    final beginRequest = pb.BeginJobRequest()
      ..jobId = jobId
      ..printerName = printerName
      ..documentName = documentName
      ..clientId = clientId
      ..authToken = authToken ?? ''
      ..metadata = (pb.JobMetadata()
        ..totalSize = Int64(originalSize)
        ..totalChunks = totalChunks
        ..compression = compressionType
        ..totalPages = totalPages
        ..datatype = datatype);

    var beginResponse = await _sendBeginJob(beginRequest);

    if (!beginResponse.success) {
      if (beginResponse.errorCode == 'E_HOST_BUSY') {
        _logger.w('Host ocupado, aguardando antes de retry...');
        await Future<void>.delayed(config.retryDelay);

        beginResponse = await _sendBeginJob(beginRequest);
        if (!beginResponse.success) {
          return SendJobResult.failure(
            jobId: jobId,
            errorCode: beginResponse.errorCode,
            errorMessage: beginResponse.errorMessage,
            chunksSent: 0,
            totalChunks: totalChunks,
            duration: DateTime.now().difference(startTime),
          );
        }
      } else {
        return SendJobResult.failure(
          jobId: jobId,
          errorCode: beginResponse.errorCode,
          errorMessage: beginResponse.errorMessage,
          chunksSent: 0,
          totalChunks: totalChunks,
          duration: DateTime.now().difference(startTime),
        );
      }
    }

    var chunksSent = 0;
    for (var i = 0; i < chunks.length; i++) {
      final chunk = chunks[i];
      final checksum = sha256.convert(chunk).toString();

      final chunkRequest = pb.SendChunkRequest()
        ..jobId = jobId
        ..chunkIndex = i
        ..totalChunks = totalChunks
        ..data = chunk
        ..checksum = checksum;

      var retries = 0;
      pb.SendChunkResponse? chunkResponse;

      while (retries <= config.maxRetries) {
        chunkResponse = await _sendChunk(chunkRequest);

        if (chunkResponse.success) {
          chunksSent++;
          onProgress?.call(chunksSent, totalChunks);
          break;
        }

        if (!chunkResponse.checksumValid) {
          _logger.w('Checksum inválido no chunk $i, retrying...');
        }

        retries++;
        if (retries <= config.maxRetries) {
          _logger.d('Retry $retries/${config.maxRetries} para chunk $i');
          await Future<void>.delayed(config.retryDelay);
        }
      }

      if (chunkResponse == null || !chunkResponse.success) {
        _logger.e('Falha ao enviar chunk $i após ${config.maxRetries} retries');
        await cancelJob(jobId, reason: 'Falha ao enviar chunk $i');

        return SendJobResult.failure(
          jobId: jobId,
          errorCode: chunkResponse?.errorCode ?? 'E_CHUNK_SEND_FAILED',
          errorMessage:
              chunkResponse?.errorMessage ?? 'Falha ao enviar chunk $i',
          chunksSent: chunksSent,
          totalChunks: totalChunks,
          duration: DateTime.now().difference(startTime),
        );
      }
    }

    final fullChecksum = sha256.convert(finalPayload).toString();
    final endRequest = pb.EndJobRequest()
      ..jobId = jobId
      ..totalChunks = totalChunks
      ..fullChecksum = fullChecksum
      ..originalSize = Int64(originalSize)
      ..compressedSize = Int64(finalPayload.length);

    final endResponse = await _sendEndJob(endRequest);

    final duration = DateTime.now().difference(startTime);

    if (endResponse.success) {
      _logger.i('Job enviado com sucesso: $jobId');
      return SendJobResult(
        success: true,
        jobId: jobId,
        chunksSent: chunksSent,
        totalChunks: totalChunks,
        duration: duration,
        result: endResponse.result,
      );
    } else {
      _logger.e('Falha ao finalizar job: ${endResponse.errorCode}');
      return SendJobResult.failure(
        jobId: jobId,
        errorCode: endResponse.errorCode,
        errorMessage: endResponse.errorMessage,
        chunksSent: chunksSent,
        totalChunks: totalChunks,
        duration: duration,
      );
    }
  }

  Future<pb.BeginJobResponse> _sendBeginJob(pb.BeginJobRequest request) async {
    _logger.d('Enviando BeginJob: ${request.jobId}');

    try {
      return await _stub!.beginJob(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao enviar BeginJob', error: e);
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao enviar BeginJob', error: e);
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  Future<pb.SendChunkResponse> _sendChunk(pb.SendChunkRequest request) async {
    _logger.d(
      'Enviando chunk ${request.chunkIndex + 1}/${request.totalChunks}',
    );

    try {
      return await _stub!.sendChunk(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao enviar chunk', error: e);
      return pb.SendChunkResponse()
        ..success = false
        ..chunkIndex = request.chunkIndex
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}'
        ..checksumValid = false;
    } catch (e) {
      _logger.e('Erro ao enviar chunk', error: e);
      return pb.SendChunkResponse()
        ..success = false
        ..chunkIndex = request.chunkIndex
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  Future<pb.EndJobResponse> _sendEndJob(pb.EndJobRequest request) async {
    _logger.d('Enviando EndJob: ${request.jobId}');

    try {
      return await _stub!.endJob(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao enviar EndJob', error: e);
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao enviar EndJob', error: e);
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  @override
  Future<pb.GetJobStatusResponse> getJobStatus(String jobId) async {
    _logger.d('Consultando status do job: $jobId');

    try {
      final request = pb.GetJobStatusRequest()..jobId = jobId;
      return await _stub!.getJobStatus(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao consultar status', error: e);
      return pb.GetJobStatusResponse()
        ..found = false
        ..status = pb.JobStatus.JOB_STATUS_UNKNOWN
        ..chunksReceived = 0
        ..totalChunks = 0
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao consultar status', error: e);
      return pb.GetJobStatusResponse()
        ..found = false
        ..status = pb.JobStatus.JOB_STATUS_UNKNOWN
        ..chunksReceived = 0
        ..totalChunks = 0
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede';
    }
  }

  @override
  Future<pb.CancelJobResponse> cancelJob(String jobId, {String? reason}) async {
    _logger.d('Cancelando job: $jobId');

    try {
      final request = pb.CancelJobRequest()
        ..jobId = jobId
        ..reason = reason ?? '';
      return await _stub!.cancelJob(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao cancelar job', error: e);
      return pb.CancelJobResponse()
        ..success = false
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao cancelar job', error: e);
      return pb.CancelJobResponse()
        ..success = false
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  @override
  Future<void> close() async {
    _logger.d('Fechando cliente');
    await _channel?.shutdown();
    _stub = null;
    _channel = null;
  }
}
