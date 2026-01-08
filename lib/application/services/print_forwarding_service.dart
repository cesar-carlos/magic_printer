import 'dart:async';

import '../../domain/domain.dart';
import '../../core/core.dart';

class _CapturedJobInfo {
  final String printerName;
  final int jobId;

  const _CapturedJobInfo({
    required this.printerName,
    required this.jobId,
  });
}

class PrintForwardingService {
  final IPrintJobCaptureService _captureService;
  final IPrintQueueService _printQueueService;
  final SpoolJobBinaryCodec _codec = SpoolJobBinaryCodec();

  Timer? _timer;
  StreamSubscription<PrintQueueItem>? _completionSubscription;
  bool _isRunning = false;
  bool _isTickRunning = false;
  String? _capturePrinterName;
  String? _targetPrinterId;
  String? _targetPrinterName;

  final Map<int, DateTime> _lastAttemptByJobId = {};
  final Map<String, _CapturedJobInfo> _queueToSpoolerMap = {};

  static const Duration _repeatDelay = Duration(seconds: 5);

  PrintForwardingService({
    required IPrintJobCaptureService captureService,
    required IPrintQueueService printQueueService,
  })  : _captureService = captureService,
        _printQueueService = printQueueService;

  bool get isRunning => _isRunning;

  int get queuedJobsCount => _queueToSpoolerMap.length;

  void start({
    required String capturePrinterName,
    required String targetPrinterId,
    required String targetPrinterName,
  }) {
    _capturePrinterName = capturePrinterName;
    _targetPrinterId = targetPrinterId;
    _targetPrinterName = targetPrinterName;

    if (_timer != null) {
      _timer!.cancel();
    }

    _completionSubscription?.cancel();
    _completionSubscription = _printQueueService.onItemCompleted.listen(
      _handleQueueItemCompleted,
    );

    _printQueueService.start();

    _isRunning = true;
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) async {
      if (!_isRunning) return;
      if (_isTickRunning) return;
      final printer = _capturePrinterName;
      final target = _targetPrinterId;
      final targetName = _targetPrinterName;
      if (printer == null || target == null || targetName == null) return;

      _isTickRunning = true;
      try {
        await _captureAndEnqueue(printer, target, targetName);
      } finally {
        _isTickRunning = false;
      }
    });
  }

  Future<void> _captureAndEnqueue(
    String capturePrinter,
    String targetId,
    String targetName,
  ) async {
    final captured = await _captureService.captureNextJob(
      printerName: capturePrinter,
      timeout: const Duration(milliseconds: 500),
    );

    if (captured.isError()) {
      return;
    }

    final job = captured.getOrThrow();

    final lastAttemptAt = _lastAttemptByJobId[job.jobId];
    final now = DateTime.now();
    if (lastAttemptAt != null && now.difference(lastAttemptAt) < _repeatDelay) {
      await _captureService.releaseJob(
        printerName: job.printerName,
        jobId: job.jobId,
      );
      return;
    }

    _lastAttemptByJobId[job.jobId] = now;

    final bundledPayload = _codec.encode(
      spl: job.spl,
      shd: job.shd,
      datatype: job.datatype,
    );

    final queueJobId = _printQueueService.enqueue(
      printerId: targetId,
      printerName: targetName,
      documentName: job.documentName,
      payload: bundledPayload,
      totalPages: job.totalPages,
      datatype: job.datatype,
    );

    _queueToSpoolerMap[queueJobId.value] = _CapturedJobInfo(
      printerName: job.printerName,
      jobId: job.jobId,
    );
  }

  Future<void> _handleQueueItemCompleted(PrintQueueItem item) async {
    final spoolerInfo = _queueToSpoolerMap.remove(item.id.value);
    if (spoolerInfo == null) return;

    _lastAttemptByJobId.remove(spoolerInfo.jobId);

    if (item.status == PrintQueueItemStatus.sent) {
      final completeResult = await _captureService.completeJob(
        printerName: spoolerInfo.printerName,
        jobId: spoolerInfo.jobId,
      );
      if (completeResult.isError()) {
        await _captureService.releaseJob(
          printerName: spoolerInfo.printerName,
          jobId: spoolerInfo.jobId,
        );
      }
    } else {
      await _captureService.releaseJob(
        printerName: spoolerInfo.printerName,
        jobId: spoolerInfo.jobId,
      );
    }
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
    _timer = null;
    _isTickRunning = false;

    _completionSubscription?.cancel();
    _completionSubscription = null;

    _printQueueService.stop();

    _lastAttemptByJobId.clear();
    _queueToSpoolerMap.clear();
  }
}


