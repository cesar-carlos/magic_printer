import 'dart:async';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:logger/logger.dart';

import '../generated/generated.dart' as pb;
import '../../../core/core.dart';
import '../../datasources/windows/windows.dart';
import 'i_grpc_auth_service.dart';

class PendingJob {
  final String jobId;
  final String printerName;
  final String documentName;
  final String clientId;
  final pb.JobMetadata metadata;
  final DateTime startedAt;
  final Map<int, Uint8List> chunks;
  pb.JobStatus status;

  PendingJob({
    required this.jobId,
    required this.printerName,
    required this.documentName,
    required this.clientId,
    required this.metadata,
  }) : startedAt = DateTime.now(),
       chunks = {},
       status = pb.JobStatus.JOB_STATUS_RECEIVING;

  int get chunksReceived => chunks.length;
  bool get isComplete => chunksReceived == metadata.totalChunks;

  Uint8List assemblePayload() {
    final sortedChunks = chunks.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final totalLength = sortedChunks.fold<int>(
      0,
      (sum, e) => sum + e.value.length,
    );
    final result = Uint8List(totalLength);

    var offset = 0;
    for (final entry in sortedChunks) {
      result.setRange(offset, offset + entry.value.length, entry.value);
      offset += entry.value.length;
    }

    return result;
  }
}

class JobTransportServiceImpl extends pb.JobTransportServiceBase {
  final SpoolerDataSource _spoolerDataSource;
  final SpoolerInjector _injector;
  final IGrpcAuthService? _authService;
  final Logger _logger;
  final SpoolJobBinaryCodec _codec = SpoolJobBinaryCodec();

  final Map<String, PendingJob> _pendingJobs = {};

  final Duration jobTimeout;
  final int maxConcurrentJobs;
  Timer? _cleanupTimer;

  JobTransportServiceImpl({
    SpoolerDataSource? spoolerDataSource,
    JobCompressor? compressor,
    SpoolerInjector? injector,
    IGrpcAuthService? authService,
    Logger? logger,
    this.jobTimeout = const Duration(minutes: 10),
    this.maxConcurrentJobs = 5,
  }) : _spoolerDataSource = spoolerDataSource ?? SpoolerDataSource(),
       _injector = injector ?? SpoolerInjector(),
       _authService = authService,
       _logger = logger ?? Logger() {
    _startCleanupTimer();
    // compressor parameter kept for future use but not stored
    if (compressor != null) {
      // Future: use compressor for job compression
    }
  }

  int get activeJobsCount {
    return _pendingJobs.values
        .where(
          (job) =>
              job.status == pb.JobStatus.JOB_STATUS_RECEIVING ||
              job.status == pb.JobStatus.JOB_STATUS_COMPLETE ||
              job.status == pb.JobStatus.JOB_STATUS_INJECTING,
        )
        .length;
  }

  void _startCleanupTimer() {
    _cleanupTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _cleanupExpiredJobs();
    });
  }

  void _cleanupExpiredJobs() {
    final now = DateTime.now();
    final expiredIds = <String>[];

    for (final entry in _pendingJobs.entries) {
      if (now.difference(entry.value.startedAt) > jobTimeout) {
        expiredIds.add(entry.key);
      }
    }

    for (final id in expiredIds) {
      _logger.w('Job expirado removido: $id');
      _pendingJobs.remove(id);
    }
  }

  void dispose() {
    _cleanupTimer?.cancel();
    _pendingJobs.clear();
  }

  @override
  Future<pb.BeginJobResponse> beginJob(
    grpc.ServiceCall call,
    pb.BeginJobRequest request,
  ) async {
    _logger.i('BeginJob: ${request.jobId} -> ${request.printerName}');

    if (_authService != null &&
        !_authService.validateToken(request.authToken)) {
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_AUTH_INVALID_TOKEN'
        ..errorMessage = 'Token inválido ou expirado';
    }

    if (_authService != null &&
        !_authService.checkPermission(
          request.authToken,
          request.printerName,
          'print',
        )) {
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_PERMISSION_DENIED'
        ..errorMessage = 'Sem permissão para imprimir nesta impressora';
    }

    if (_pendingJobs.containsKey(request.jobId)) {
      _logger.d('Job já existe (idempotência): ${request.jobId}');
      return pb.BeginJobResponse()
        ..success = true
        ..hostJobId = request.jobId;
    }

    if (activeJobsCount >= maxConcurrentJobs) {
      _logger.w(
        'Backpressure: limite de jobs simultâneos atingido ($activeJobsCount/$maxConcurrentJobs)',
      );
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_HOST_BUSY'
        ..errorMessage =
            'Host ocupado: limite de jobs simultâneos atingido. Tente novamente em alguns segundos.';
    }

    final printers = _spoolerDataSource.enumeratePrinters();
    final printerExists = printers.any((p) => p.name == request.printerName);
    if (!printerExists) {
      return pb.BeginJobResponse()
        ..success = false
        ..errorCode = 'E_PRINTER_NOT_FOUND'
        ..errorMessage = 'Impressora não encontrada: ${request.printerName}';
    }

    final pendingJob = PendingJob(
      jobId: request.jobId,
      printerName: request.printerName,
      documentName: request.documentName,
      clientId: request.clientId,
      metadata: request.metadata,
    );

    _pendingJobs[request.jobId] = pendingJob;

    _logger.i(
      'Job iniciado: ${request.jobId} (${request.metadata.totalChunks} chunks)',
    );

    return pb.BeginJobResponse()
      ..success = true
      ..hostJobId = request.jobId;
  }

  @override
  Future<pb.SendChunkResponse> sendChunk(
    grpc.ServiceCall call,
    pb.SendChunkRequest request,
  ) async {
    final job = _pendingJobs[request.jobId];
    if (job == null) {
      return pb.SendChunkResponse()
        ..success = false
        ..chunkIndex = request.chunkIndex
        ..errorCode = 'E_JOB_NOT_FOUND'
        ..errorMessage = 'Job não encontrado: ${request.jobId}'
        ..checksumValid = false;
    }

    if (job.status != pb.JobStatus.JOB_STATUS_RECEIVING) {
      return pb.SendChunkResponse()
        ..success = false
        ..chunkIndex = request.chunkIndex
        ..errorCode = 'E_JOB_NOT_RECEIVING'
        ..errorMessage = 'Job não está em estado de recebimento'
        ..checksumValid = false;
    }

    final computedChecksum = sha256
        .convert(Uint8List.fromList(request.data))
        .toString();
    if (computedChecksum != request.checksum) {
      _logger.w('Checksum inválido para chunk ${request.chunkIndex}');
      return pb.SendChunkResponse()
        ..success = false
        ..chunkIndex = request.chunkIndex
        ..errorCode = 'E_CHECKSUM_INVALID'
        ..errorMessage = 'Checksum inválido'
        ..checksumValid = false;
    }

    job.chunks[request.chunkIndex] = Uint8List.fromList(request.data);

    _logger.d(
      'Chunk ${request.chunkIndex + 1}/${request.totalChunks} recebido para ${request.jobId}',
    );

    return pb.SendChunkResponse()
      ..success = true
      ..chunkIndex = request.chunkIndex
      ..checksumValid = true;
  }

  @override
  Future<pb.EndJobResponse> endJob(
    grpc.ServiceCall call,
    pb.EndJobRequest request,
  ) async {
    final job = _pendingJobs[request.jobId];
    if (job == null) {
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_JOB_NOT_FOUND'
        ..errorMessage = 'Job não encontrado: ${request.jobId}';
    }

    if (job.chunksReceived != request.totalChunks) {
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_CHUNKS_MISSING'
        ..errorMessage =
            'Chunks faltando: esperado ${request.totalChunks}, recebido ${job.chunksReceived}';
    }

    _logger.i('Finalizando job: ${request.jobId}');

    job.status = pb.JobStatus.JOB_STATUS_COMPLETE;

    final compressedPayload = job.assemblePayload();

    final computedChecksum = sha256.convert(compressedPayload).toString();
    if (computedChecksum != request.fullChecksum) {
      job.status = pb.JobStatus.JOB_STATUS_FAILED;
      _pendingJobs.remove(request.jobId);
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_CHECKSUM_MISMATCH'
        ..errorMessage = 'Checksum do payload completo não confere';
    }

    job.status = pb.JobStatus.JOB_STATUS_INJECTING;

    final Uint8List bundledPayload = job.metadata.compression == 'gzip'
        ? JobCompressor().decompress(compressedPayload)
        : compressedPayload;

    var injected = false;

    try {
      final decoded = _codec.decode(bundledPayload);
      injected = await _injector.injectSpoolJob(
        printerName: job.printerName,
        splData: decoded.spl,
        shdData: decoded.shd,
      );
    } catch (_) {
      // fallback para modo antigo (WritePrinter), mantendo compatibilidade
      injected = await _injector.injectJob(
        printerName: job.printerName,
        splData: compressedPayload,
        documentName: job.documentName,
        datatype: job.metadata.datatype.isEmpty ? 'RAW' : job.metadata.datatype,
        isCompressed: job.metadata.compression == 'gzip',
      );
    }

    _pendingJobs.remove(request.jobId);

    if (injected) {
      _logger.i('Job injetado com sucesso: ${request.jobId}');
      return pb.EndJobResponse()
        ..success = true
        ..result = (pb.JobResult()
          ..status = pb.JobStatus.JOB_STATUS_SPOOLED
          ..printerName = job.printerName
          ..bytesWritten = Int64(request.originalSize.toInt()));
    } else {
      _logger.e('Falha ao injetar job: ${request.jobId}');
      return pb.EndJobResponse()
        ..success = false
        ..errorCode = 'E_INJECTION_FAILED'
        ..errorMessage = 'Falha ao injetar job no spooler';
    }
  }

  @override
  Future<pb.CancelJobResponse> cancelJob(
    grpc.ServiceCall call,
    pb.CancelJobRequest request,
  ) async {
    final job = _pendingJobs.remove(request.jobId);
    if (job == null) {
      return pb.CancelJobResponse()..success = true;
    }

    _logger.i('Job cancelado: ${request.jobId} (motivo: ${request.reason})');

    return pb.CancelJobResponse()..success = true;
  }

  @override
  Future<pb.GetJobStatusResponse> getJobStatus(
    grpc.ServiceCall call,
    pb.GetJobStatusRequest request,
  ) async {
    final job = _pendingJobs[request.jobId];
    if (job == null) {
      return pb.GetJobStatusResponse()
        ..found = false
        ..status = pb.JobStatus.JOB_STATUS_UNKNOWN
        ..chunksReceived = 0
        ..totalChunks = 0;
    }

    return pb.GetJobStatusResponse()
      ..found = true
      ..status = job.status
      ..chunksReceived = job.chunksReceived
      ..totalChunks = job.metadata.totalChunks;
  }

  @override
  Stream<pb.ChunkAck> streamChunks(
    grpc.ServiceCall call,
    Stream<pb.ChunkData> request,
  ) async* {
    await for (final chunk in request) {
      final job = _pendingJobs[chunk.jobId];
      if (job == null) {
        yield pb.ChunkAck()
          ..jobId = chunk.jobId
          ..chunkIndex = chunk.chunkIndex
          ..success = false
          ..errorCode = 'E_JOB_NOT_FOUND';
        continue;
      }

      if (job.status != pb.JobStatus.JOB_STATUS_RECEIVING) {
        yield pb.ChunkAck()
          ..jobId = chunk.jobId
          ..chunkIndex = chunk.chunkIndex
          ..success = false
          ..errorCode = 'E_JOB_NOT_RECEIVING';
        continue;
      }

      final computedChecksum = sha256
          .convert(Uint8List.fromList(chunk.data))
          .toString();
      if (computedChecksum != chunk.checksum) {
        _logger.w('Checksum inválido para chunk ${chunk.chunkIndex}');
        yield pb.ChunkAck()
          ..jobId = chunk.jobId
          ..chunkIndex = chunk.chunkIndex
          ..success = false
          ..errorCode = 'E_CHECKSUM_INVALID';
        continue;
      }

      job.chunks[chunk.chunkIndex] = Uint8List.fromList(chunk.data);

      _logger.d(
        'Chunk ${chunk.chunkIndex + 1}/${job.metadata.totalChunks} recebido para ${chunk.jobId} (stream)',
      );

      yield pb.ChunkAck()
        ..jobId = chunk.jobId
        ..chunkIndex = chunk.chunkIndex
        ..success = true;
    }
  }
}
