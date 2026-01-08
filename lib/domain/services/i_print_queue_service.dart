import 'dart:typed_data';

import '../entities/print_queue_item.dart';
import '../value_objects/job_id.dart';

abstract class IPrintQueueService {
  List<PrintQueueItem> get queue;

  List<PrintQueueItem> get pendingItems;

  List<PrintQueueItem> get completedItems;

  PrintQueueItem? get currentItem;

  bool get isProcessing;

  Stream<PrintQueueItem> get onItemUpdated;

  Stream<PrintQueueItem> get onItemCompleted;

  JobId enqueue({
    required String printerId,
    required String printerName,
    required String documentName,
    required Uint8List payload,
    int totalPages,
    String datatype,
  });

  void cancel(JobId jobId);

  void cancelAll();

  void retry(JobId jobId);

  void start();

  void stop();

  void clearCompleted();

  void dispose();
}
