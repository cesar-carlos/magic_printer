import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../domain/domain.dart';
import 'safe_notifier_mixin.dart';

class PrintQueueProvider extends ChangeNotifier with SafeNotifierMixin {
  final IPrintQueueService _queueService;

  StreamSubscription<PrintQueueItem>? _itemUpdatedSubscription;
  StreamSubscription<PrintQueueItem>? _itemCompletedSubscription;

  PrintQueueProvider(this._queueService) {
    _itemUpdatedSubscription = _queueService.onItemUpdated.listen((_) {
      notifyListeners();
    });

    _itemCompletedSubscription = _queueService.onItemCompleted.listen((_) {
      notifyListeners();
    });
  }

  List<PrintQueueItem> get queue => _queueService.queue;

  List<PrintQueueItem> get pendingItems => _queueService.pendingItems;

  List<PrintQueueItem> get completedItems => _queueService.completedItems;

  PrintQueueItem? get currentItem => _queueService.currentItem;

  bool get isProcessing => _queueService.isProcessing;

  int get pendingCount => pendingItems.length;

  int get completedCount => completedItems.length;

  int get failedCount =>
      completedItems.where((i) => i.status == PrintQueueItemStatus.failed).length;

  JobId enqueue({
    required String printerId,
    required String printerName,
    required String documentName,
    required Uint8List payload,
    int totalPages = 0,
    String datatype = 'RAW',
  }) {
    final jobId = _queueService.enqueue(
      printerId: printerId,
      printerName: printerName,
      documentName: documentName,
      payload: payload,
      totalPages: totalPages,
      datatype: datatype,
    );
    notifyListeners();
    return jobId;
  }

  void cancel(JobId jobId) {
    _queueService.cancel(jobId);
    notifyListeners();
  }

  void cancelAll() {
    _queueService.cancelAll();
    notifyListeners();
  }

  void retry(JobId jobId) {
    _queueService.retry(jobId);
    notifyListeners();
  }

  void start() {
    _queueService.start();
    notifyListeners();
  }

  void stop() {
    _queueService.stop();
    notifyListeners();
  }

  void clearCompleted() {
    _queueService.clearCompleted();
    notifyListeners();
  }

  @override
  void dispose() {
    _itemUpdatedSubscription?.cancel();
    _itemCompletedSubscription?.cancel();
    super.dispose();
  }
}
