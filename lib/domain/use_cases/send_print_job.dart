import 'dart:typed_data';

import 'package:result_dart/result_dart.dart';

import '../entities/print_job.dart';
import '../entities/printer.dart';
import '../errors/failures.dart';
import '../repositories/i_host_repository.dart';
import '../repositories/i_job_repository.dart';
import '../repositories/i_printer_repository.dart';
import '../value_objects/job_id.dart';

class SendPrintJobParams {
  final String printerId;
  final String documentName;
  final Uint8List payload;
  final int totalPages;
  final String datatype;

  const SendPrintJobParams({
    required this.printerId,
    required this.documentName,
    required this.payload,
    this.totalPages = 0,
    this.datatype = 'RAW',
  });
}

abstract class IJobTransportUseCase {
  Future<Result<Unit>> send({
    required String hostId,
    required String printerName,
    required String documentName,
    required Uint8List payload,
    required String token,
    int totalPages,
    String datatype,
    void Function(int sent, int total)? onProgress,
  });
}

class SendPrintJob {
  final IPrinterRepository _printerRepository;
  final IHostRepository _hostRepository;
  final IJobRepository _jobRepository;
  final IJobTransportUseCase _transportUseCase;

  SendPrintJob({
    required IPrinterRepository printerRepository,
    required IHostRepository hostRepository,
    required IJobRepository jobRepository,
    required IJobTransportUseCase transportUseCase,
  }) : _printerRepository = printerRepository,
       _hostRepository = hostRepository,
       _jobRepository = jobRepository,
       _transportUseCase = transportUseCase;

  Future<Result<PrintJob>> call(SendPrintJobParams params) async {
    final printerResult = await _printerRepository.getById(params.printerId);

    if (printerResult.isError()) {
      return printerResult.exceptionOrNull()!.toFailure();
    }

    final printer = printerResult.getOrThrow();

    if (!printer.isAvailable) {
      return PrinterException.offline(printer.name).toFailure();
    }

    final jobId = JobId.generate();
    var job = PrintJob(
      id: jobId,
      documentName: params.documentName,
      printerName: printer.name,
      hostId: printer.hostId,
      status: PrintJobStatus.pending,
      totalSize: params.payload.length,
      totalPages: params.totalPages,
      createdAt: DateTime.now(),
    );

    final createResult = await _jobRepository.create(job);
    if (createResult.isError()) {
      return createResult.exceptionOrNull()!.toFailure();
    }

    if (printer.isRemote && printer.hostId != null) {
      return _sendToRemotePrinter(job, printer, params);
    } else {
      return _sendToLocalPrinter(job);
    }
  }

  Future<Result<PrintJob>> _sendToRemotePrinter(
    PrintJob job,
    Printer printer,
    SendPrintJobParams params,
  ) async {
    final hostResult = await _hostRepository.getById(printer.hostId!);

    if (hostResult.isError()) {
      final failure = hostResult.exceptionOrNull()!;
      await _updateJobStatus(
        job,
        PrintJobStatus.failed,
        'E_HOST_ERROR',
        failure.toString(),
      );
      return failure.toFailure();
    }

    final host = hostResult.getOrThrow();

    if (!host.isOnline) {
      final failure = NetworkException.hostOffline(host.name);
      await _updateJobStatus(
        job,
        PrintJobStatus.failed,
        failure.code,
        failure.message,
      );
      return failure.toFailure();
    }

    if (!host.isAuthenticated) {
      final failure = AuthException.unauthorized();
      await _updateJobStatus(
        job,
        PrintJobStatus.failed,
        failure.code,
        failure.message,
      );
      return failure.toFailure();
    }

    job = job.copyWith(
      status: PrintJobStatus.sending,
      startedAt: DateTime.now(),
    );
    await _jobRepository.update(job);

    final sendResult = await _transportUseCase.send(
      hostId: host.id,
      printerName: printer.name,
      documentName: params.documentName,
      payload: params.payload,
      token: host.token?.value ?? '',
      totalPages: params.totalPages,
      datatype: params.datatype,
      onProgress: (sent, total) async {
        job = job.copyWith(sentChunks: sent, totalChunks: total);
        await _jobRepository.update(job);
      },
    );

    if (sendResult.isError()) {
      final failure = sendResult.exceptionOrNull()!;
      await _updateJobStatus(
        job,
        PrintJobStatus.failed,
        'E_SEND_FAILED',
        failure.toString(),
      );
      return failure.toFailure();
    }

    job = job.copyWith(
      status: PrintJobStatus.sent,
      completedAt: DateTime.now(),
    );
    await _jobRepository.update(job);
    return Success(job);
  }

  Future<Result<PrintJob>> _sendToLocalPrinter(PrintJob job) async {
    job = job.copyWith(
      status: PrintJobStatus.spooled,
      startedAt: DateTime.now(),
      completedAt: DateTime.now(),
    );
    await _jobRepository.update(job);
    return Success(job);
  }

  Future<void> _updateJobStatus(
    PrintJob job,
    PrintJobStatus status,
    String? errorCode,
    String? errorMessage,
  ) async {
    final updatedJob = job.copyWith(
      status: status,
      errorCode: errorCode,
      errorMessage: errorMessage,
      completedAt: DateTime.now(),
    );
    await _jobRepository.update(updatedJob);
  }
}
