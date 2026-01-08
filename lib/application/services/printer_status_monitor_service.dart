import 'dart:async';

import '../../domain/domain.dart';

const _monitoringInterval = Duration(seconds: 10);

class PrinterStatusMonitorService {
  final ILocalNotificationService _notificationService;
  final IPrinterRepository _printerRepository;
  Timer? _checkTimer;

  final _lastKnownStatus = <String, PrinterStatus>{};

  PrinterStatusMonitorService({
    required ILocalNotificationService notificationService,
    required IPrinterRepository printerRepository,
  })  : _notificationService = notificationService,
        _printerRepository = printerRepository {
    _checkTimer?.cancel();
  }

  bool get isEnabled => _notificationService.isEnabled;

  void setEnabled(bool enabled) {
    _checkTimer?.cancel();
    _checkTimer = null;

    if (enabled) {
      _startMonitoring();
    }
  }

  Future<void> _startMonitoring() async {
    if (_checkTimer != null && _checkTimer!.isActive) {
      return;
    }

    _checkTimer = Timer.periodic(_monitoringInterval, (_) async {
      await _checkPrintersStatus();
    });
  }

  Future<void> _checkPrintersStatus() async {
    final printersResult = await _printerRepository.getAll();

    if (printersResult.isError()) {
      return;
    }

    final printers = printersResult.getOrThrow();

    for (final printer in printers) {
      final currentStatus = _lastKnownStatus[printer.id];

      if (currentStatus == null) {
        _lastKnownStatus[printer.id] = printer.status;
      } else if (currentStatus != printer.status) {
        await _notificationService.showPrinterStatusChanged(
          printerName: printer.displayName,
          oldStatus: currentStatus,
          newStatus: printer.status,
        );

        _lastKnownStatus[printer.id] = printer.status;
      }
    }
  }

  void dispose() {
    _checkTimer?.cancel();
    _checkTimer = null;
    _lastKnownStatus.clear();
  }
}
