import 'package:result_dart/result_dart.dart';

import '../entities/captured_spool_job.dart';

abstract class IPrintJobCaptureService {
  Future<Result<CapturedSpoolJob>> captureNextJob({
    required String printerName,
    Duration timeout,
  });

  Future<Result<Unit>> completeJob({
    required String printerName,
    required int jobId,
  });

  Future<Result<Unit>> releaseJob({
    required String printerName,
    required int jobId,
  });
}
