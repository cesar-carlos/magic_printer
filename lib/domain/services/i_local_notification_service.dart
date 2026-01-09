import '../../domain/domain.dart';

abstract class ILocalNotificationService {
  Future<void> showPrinterStatusChanged({
    required String printerName,
    required PrinterStatus oldStatus,
    required PrinterStatus newStatus,
  });

  Future<void> showJobCompleted({
    required String printerName,
    required String documentName,
  });

  Future<void> showPrinterError({
    required String printerName,
    required String error,
  });

  Future<void> clearAll();

  void setEnabled(bool enabled);
  bool get isEnabled;
  
  Future<void> initialize();

  Future<void> showHealthAlert({
    required String printerId,
    required int healthScore,
    required String message,
  });

  Future<void> showPredictionAlert({
    required Prediction prediction,
  });

  Future<void> showActionExecutedAlert({
    required AutomatedAction action,
  });

  Future<void> showQueueAlert({
    required String printerName,
    required int queueSize,
    required String message,
  });
}

