import 'dart:async';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';

class QueueMonitorService {
  final IJobRepository _jobRepository;
  final IPrinterRepository _printerRepository;
  final ILocalNotificationService _notificationService;

  Timer? _monitoringTimer;
  bool _isEnabled = false;

  QueueMonitorService({
    required IJobRepository jobRepository,
    required IPrinterRepository printerRepository,
    required ILocalNotificationService notificationService,
  })  : _jobRepository = jobRepository,
        _printerRepository = printerRepository,
        _notificationService = notificationService;

  bool get isEnabled => _isEnabled;

  void setEnabled(bool enabled) {
    if (_isEnabled == enabled) return;

    _isEnabled = enabled;

    if (enabled) {
      _startMonitoring();
    } else {
      _stopMonitoring();
    }
  }

  void _startMonitoring() {
    if (_monitoringTimer != null && _monitoringTimer!.isActive) {
      return;
    }

    _monitoringTimer = Timer.periodic(
      const Duration(minutes: 2),
      (_) => _checkQueues(),
    );

    _checkQueues();
  }

  void _stopMonitoring() {
    _monitoringTimer?.cancel();
    _monitoringTimer = null;
  }

  Future<void> _checkQueues() async {
    try {
      final printersResult = await _printerRepository.getAll();
      if (printersResult.isError()) return;

      final printers = printersResult.getOrThrow();

      for (final printer in printers) {
        await _checkPrinterQueue(printer);
      }
    } catch (e) {
      return;
    }
  }

  Future<void> _checkPrinterQueue(Printer printer) async {
    try {
      final jobsResult = await _jobRepository.getByStatus(PrintJobStatus.spooled);
      if (jobsResult.isError()) return;

      final jobs = jobsResult.getOrThrow();
      final printerJobs = jobs.where((j) => j.printerName == printer.name).toList();

      if (printerJobs.length > defaultQueueSizeThreshold) {
        await _notificationService.showPrinterError(
          printerName: printer.displayName,
          error: 'Fila cheia: ${printerJobs.length} jobs pendentes',
        );
      }

      for (final job in printerJobs) {
        final timeSinceCreated = DateTime.now().difference(job.createdAt);
        if (timeSinceCreated >= defaultQueueStuckThreshold) {
          await _notificationService.showPrinterError(
            printerName: printer.displayName,
            error: 'Job travado: ${job.documentName} há ${timeSinceCreated.inMinutes} minutos',
          );
        }
      }
    } catch (e) {
      return;
    }
  }

  void dispose() {
    _stopMonitoring();
  }
}
