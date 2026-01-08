import 'dart:async';
import 'dart:typed_data';

import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import 'spooler_datasource.dart';

class WindowsPrintJobCaptureService implements IPrintJobCaptureService {
  final SpoolerDataSource _dataSource;

  WindowsPrintJobCaptureService({SpoolerDataSource? dataSource})
      : _dataSource = dataSource ?? SpoolerDataSource();

  @override
  Future<Result<CapturedSpoolJob>> captureNextJob({
    required String printerName,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      return Failure(PrinterException.notFound(printerName));
    }

    final deadline = DateTime.now().add(timeout);

    try {
      while (DateTime.now().isBefore(deadline)) {
        final jobs = _dataSource.enumerateJobs(hPrinter);
        if (jobs.isEmpty) {
          await Future<void>.delayed(const Duration(milliseconds: 200));
          continue;
        }

        jobs.sort((a, b) => b.jobId.compareTo(a.jobId));
        final job = jobs.first;

        _dataSource.pauseJob(hPrinter, job.jobId);

        Uint8List? spl;
        Uint8List? shd;

        for (var i = 0; i < 20; i++) {
          final files = await _dataSource.captureJobFiles(job);
          spl = files.spl;
          shd = files.shd;
          if (spl != null) {
            break;
          }
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }

        if (spl == null) {
          return Failure(SpoolerException.captureFailed());
        }

        return Success(
          CapturedSpoolJob(
            printerName: printerName,
            jobId: job.jobId,
            documentName: job.documentName ?? 'document',
            spl: spl,
            shd: shd,
            totalPages: job.totalPages,
            datatype: job.datatype ?? 'RAW',
          ),
        );
      }

      return Failure(NetworkException.timeout());
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }

  @override
  Future<Result<Unit>> completeJob({
    required String printerName,
    required int jobId,
  }) async {
    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      return Failure(PrinterException.notFound(printerName));
    }

    try {
      final ok = _dataSource.cancelJob(hPrinter, jobId);
      if (!ok) {
        return Failure(SpoolerException.operationFailed('cancelJob'));
      }
      return const Success(unit);
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }

  @override
  Future<Result<Unit>> releaseJob({
    required String printerName,
    required int jobId,
  }) async {
    final hPrinter = _dataSource.openPrinter(printerName);
    if (hPrinter == null) {
      return Failure(PrinterException.notFound(printerName));
    }

    try {
      final ok = _dataSource.resumeJob(hPrinter, jobId);
      if (!ok) {
        return Failure(SpoolerException.operationFailed('resumeJob'));
      }
      return const Success(unit);
    } finally {
      _dataSource.closePrinter(hPrinter);
    }
  }
}


