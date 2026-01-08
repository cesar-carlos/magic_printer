import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';

import 'job_compressor.dart';
import 'printer_info.dart';
import 'spooler_datasource.dart';

class SpoolerInjector {
  final SpoolerDataSource _dataSource;
  final JobCompressor _compressor;
  final Logger _logger;

  SpoolerInjector({
    SpoolerDataSource? dataSource,
    JobCompressor? compressor,
    Logger? logger,
  })  : _dataSource = dataSource ?? SpoolerDataSource(),
        _compressor = compressor ?? JobCompressor(),
        _logger = logger ?? Logger();

  Future<bool> injectSpoolJob({
    required String printerName,
    required Uint8List splData,
    Uint8List? shdData,
  }) async {
    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      _logger.e('Falha ao abrir impressora: $printerName');
      return false;
    }

    try {
      final job = _dataSource.addJob(hPrinter);
      if (job == null) {
        _logger.e('Falha ao criar job (AddJob) em: $printerName');
        return false;
      }

      final spoolFile = File(job.spoolPath);
      await spoolFile.writeAsBytes(splData, flush: true);

      if (shdData != null) {
        final shdPath = job.spoolPath.toUpperCase().endsWith('.SPL')
            ? '${job.spoolPath.substring(0, job.spoolPath.length - 4)}.SHD'
            : '${job.spoolPath}.SHD';
        try {
          await File(shdPath).writeAsBytes(shdData, flush: true);
        } catch (e) {
          _logger.w('Falha ao escrever SHD (continuando): $e');
        }
      }

      final scheduled = _dataSource.scheduleJob(hPrinter, job.jobId);
      if (!scheduled) {
        _logger.e('Falha ao agendar job (ScheduleJob): ${job.jobId}');
        return false;
      }

      _logger.i('Job agendado com sucesso (ScheduleJob): ${job.jobId}');
      return true;
    } catch (e) {
      _logger.e('Erro ao injetar spool job', error: e);
      return false;
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }

  Future<bool> injectJob({
    required String printerName,
    required Uint8List splData,
    Uint8List? shdData,
    required String documentName,
    String datatype = 'RAW',
    bool isCompressed = true,
  }) async {
    _logger.i('Iniciando injeção de job na impressora: $printerName');

    final Uint8List finalSplData;
    if (isCompressed) {
      _logger.d('Descomprimindo payload...');
      finalSplData = _compressor.decompress(splData);
      _logger.d('Payload descomprimido: ${finalSplData.length} bytes');
    } else {
      finalSplData = splData;
    }

    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      _logger.e('Falha ao abrir impressora: $printerName');
      return false;
    }

    try {
      _logger.d('Impressora aberta, handle: $hPrinter');

      final success = await _dataSource.writeSpoolFile(
        hPrinter,
        documentName,
        finalSplData,
        datatype,
      );

      if (success) {
        _logger.i('Job injetado com sucesso!');
      } else {
        _logger.e('Falha ao injetar job');
      }

      return success;
    } finally {
      _dataSource.closePrinter(hPrinter);
      _logger.d('Impressora fechada');
    }
  }

  Future<bool> injectFromFiles({
    required String printerName,
    required String splFilePath,
    String? shdFilePath,
    required String documentName,
  }) async {
    _logger.i('Carregando arquivos do disco...');

    final splFile = File(splFilePath);
    if (!await splFile.exists()) {
      _logger.e('Arquivo SPL não encontrado: $splFilePath');
      return false;
    }

    final splData = await splFile.readAsBytes();
    _logger.d('SPL carregado: ${splData.length} bytes');

    Uint8List? shdData;
    if (shdFilePath != null) {
      final shdFile = File(shdFilePath);
      if (await shdFile.exists()) {
        shdData = await shdFile.readAsBytes();
        _logger.d('SHD carregado: ${shdData.length} bytes');
      }
    }

    return injectJob(
      printerName: printerName,
      splData: splData,
      shdData: shdData,
      documentName: documentName,
      isCompressed: false,
    );
  }
}

class SpikeResult {
  final bool success;
  final String? errorMessage;
  final Duration? captureTime;
  final Duration? compressTime;
  final Duration? transferTime;
  final Duration? injectTime;
  final int? originalSize;
  final int? compressedSize;
  final PrintJobInfo? jobInfo;

  const SpikeResult({
    required this.success,
    this.errorMessage,
    this.captureTime,
    this.compressTime,
    this.transferTime,
    this.injectTime,
    this.originalSize,
    this.compressedSize,
    this.jobInfo,
  });

  double get compressionRatio =>
      (originalSize != null && compressedSize != null && originalSize! > 0)
          ? compressedSize! / originalSize!
          : 1.0;

  @override
  String toString() {
    final buffer = StringBuffer('SpikeResult:\n');
    buffer.writeln('  success: $success');
    if (errorMessage != null) buffer.writeln('  error: $errorMessage');
    if (captureTime != null) buffer.writeln('  capture: ${captureTime!.inMilliseconds}ms');
    if (compressTime != null) buffer.writeln('  compress: ${compressTime!.inMilliseconds}ms');
    if (transferTime != null) buffer.writeln('  transfer: ${transferTime!.inMilliseconds}ms');
    if (injectTime != null) buffer.writeln('  inject: ${injectTime!.inMilliseconds}ms');
    if (originalSize != null) buffer.writeln('  originalSize: $originalSize bytes');
    if (compressedSize != null) buffer.writeln('  compressedSize: $compressedSize bytes');
    if (originalSize != null && compressedSize != null) {
      buffer.writeln('  compressionRatio: ${(compressionRatio * 100).toStringAsFixed(1)}%');
    }
    return buffer.toString();
  }
}

class SpikeRunner {
  final SpoolerDataSource _dataSource;
  final JobCompressor _compressor;
  final SpoolerInjector _injector;
  final Logger _logger;

  SpikeRunner({
    SpoolerDataSource? dataSource,
    JobCompressor? compressor,
    SpoolerInjector? injector,
    Logger? logger,
  })  : _dataSource = dataSource ?? SpoolerDataSource(),
        _compressor = compressor ?? JobCompressor(),
        _injector = injector ?? SpoolerInjector(),
        _logger = logger ?? Logger();

  Future<SpikeResult> runCaptureTest({
    required String sourcePrinterName,
    int? specificJobId,
    Duration waitForJob = const Duration(seconds: 30),
  }) async {
    _logger.i('=== SPIKE E1: Captura de Job ===');
    _logger.i('Impressora: $sourcePrinterName');

    final hPrinter = _dataSource.openPrinter(sourcePrinterName);
    if (hPrinter == null) {
      return const SpikeResult(
        success: false,
        errorMessage: 'Falha ao abrir impressora',
      );
    }

    try {
      PrintJobInfo? targetJob;

      if (specificJobId != null) {
        final jobs = _dataSource.enumerateJobs(hPrinter);
        targetJob = jobs.where((j) => j.jobId == specificJobId).firstOrNull;
      } else {
        _logger.i('Aguardando job na fila (max ${waitForJob.inSeconds}s)...');

        final startWait = DateTime.now();
        while (DateTime.now().difference(startWait) < waitForJob) {
          final jobs = _dataSource.enumerateJobs(hPrinter);
          if (jobs.isNotEmpty) {
            targetJob = jobs.first;
            break;
          }
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }
      }

      if (targetJob == null) {
        return const SpikeResult(
          success: false,
          errorMessage: 'Nenhum job encontrado',
        );
      }

      _logger.i('Job encontrado: ${targetJob.jobId} - ${targetJob.documentName}');

      final captureStart = DateTime.now();
      final files = await _dataSource.captureJobFiles(targetJob);
      final captureTime = DateTime.now().difference(captureStart);

      if (files.spl == null) {
        return SpikeResult(
          success: false,
          errorMessage: 'Arquivo SPL não encontrado',
          jobInfo: targetJob,
        );
      }

      _logger.i('SPL capturado: ${files.spl!.length} bytes');
      if (files.shd != null) {
        _logger.i('SHD capturado: ${files.shd!.length} bytes');
      }

      final compressStart = DateTime.now();
      final payload = _compressor.createPayload(
        splData: files.spl!,
        shdData: files.shd,
      );
      final compressTime = DateTime.now().difference(compressStart);

      _logger.i('Compressão: ${payload.originalSize} -> ${payload.compressedSize} bytes');
      _logger.i('Taxa: ${(payload.compressionRatio * 100).toStringAsFixed(1)}%');

      return SpikeResult(
        success: true,
        captureTime: captureTime,
        compressTime: compressTime,
        originalSize: payload.originalSize,
        compressedSize: payload.compressedSize,
        jobInfo: targetJob,
      );
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }

  Future<SpikeResult> runFullSpike({
    required String sourcePrinterName,
    required String targetPrinterName,
    int? specificJobId,
    Duration waitForJob = const Duration(seconds: 30),
  }) async {
    _logger.i('=== SPIKE COMPLETO: Captura -> Compressão -> Injeção ===');
    _logger.i('Origem: $sourcePrinterName');
    _logger.i('Destino: $targetPrinterName');

    final captureResult = await runCaptureTest(
      sourcePrinterName: sourcePrinterName,
      specificJobId: specificJobId,
      waitForJob: waitForJob,
    );

    if (!captureResult.success) {
      return captureResult;
    }

    final hSourcePrinter = _dataSource.openPrinter(sourcePrinterName);
    if (hSourcePrinter == null) {
      return const SpikeResult(
        success: false,
        errorMessage: 'Falha ao reabrir impressora fonte',
      );
    }

    try {
      final jobs = _dataSource.enumerateJobs(hSourcePrinter);
      final targetJob = specificJobId != null
          ? jobs.where((j) => j.jobId == specificJobId).firstOrNull
          : jobs.firstOrNull;

      if (targetJob == null) {
        return const SpikeResult(
          success: false,
          errorMessage: 'Job não encontrado para transferência',
        );
      }

      final files = await _dataSource.captureJobFiles(targetJob);
      if (files.spl == null) {
        return const SpikeResult(
          success: false,
          errorMessage: 'Arquivo SPL não disponível',
        );
      }

      final payload = _compressor.createPayload(
        splData: files.spl!,
        shdData: files.shd,
      );

      _logger.i('=== Iniciando Injeção ===');

      final injectStart = DateTime.now();
      final injectSuccess = await _injector.injectJob(
        printerName: targetPrinterName,
        splData: payload.splData,
        shdData: payload.shdData,
        documentName: targetJob.documentName ?? 'Spike Test Job',
        isCompressed: true,
      );
      final injectTime = DateTime.now().difference(injectStart);

      return SpikeResult(
        success: injectSuccess,
        errorMessage: injectSuccess ? null : 'Falha na injeção',
        captureTime: captureResult.captureTime,
        compressTime: captureResult.compressTime,
        injectTime: injectTime,
        originalSize: captureResult.originalSize,
        compressedSize: captureResult.compressedSize,
        jobInfo: targetJob,
      );
    } finally {
      _dataSource.closePrinter(hSourcePrinter);
    }
  }

  void listPrinters() {
    _logger.i('=== Impressoras Disponíveis ===');
    final printers = _dataSource.enumeratePrinters();
    for (final printer in printers) {
      _logger.i('  - ${printer.name} [${printer.statusDescription}]');
      if (printer.driverName != null) {
        _logger.d('    Driver: ${printer.driverName}');
      }
    }
  }

  Future<void> listJobs(String printerName) async {
    _logger.i('=== Jobs na Fila: $printerName ===');

    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      _logger.e('Falha ao abrir impressora');
      return;
    }

    try {
      final jobs = _dataSource.enumerateJobs(hPrinter);
      if (jobs.isEmpty) {
        _logger.i('Nenhum job na fila');
        return;
      }

      for (final job in jobs) {
        _logger.i('  - Job ${job.jobId}: ${job.documentName}');
        _logger.d('    Status: ${job.statusDescription}');
        _logger.d('    Tamanho: ${job.size} bytes');
        _logger.d('    Páginas: ${job.pagesPrinted}/${job.totalPages}');
      }
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }
}

