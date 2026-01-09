import 'dart:typed_data';

import '../value_objects/job_id.dart';

enum PrintQueueItemStatus {
  pending,
  waitingPrinter,
  sending,
  sent,
  failed,
  cancelled,
}

class PrintQueueItem {
  final JobId id;
  final String printerId;
  final String printerName;
  final String documentName;
  final Uint8List payload;
  final int totalPages;
  final String datatype;
  final PrintQueueItemStatus status;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int retryCount;
  final String? errorCode;
  final String? errorMessage;
  final String? lastPrinterStatus;
  final String? userId;
  final String? username;
  final String? documentType;
  final String? department;

  const PrintQueueItem({
    required this.id,
    required this.printerId,
    required this.printerName,
    required this.documentName,
    required this.payload,
    this.totalPages = 0,
    this.datatype = 'RAW',
    this.status = PrintQueueItemStatus.pending,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    this.retryCount = 0,
    this.errorCode,
    this.errorMessage,
    this.lastPrinterStatus,
    this.userId,
    this.username,
    this.documentType,
    this.department,
  });

  bool get isPending => status == PrintQueueItemStatus.pending;
  bool get isWaitingPrinter => status == PrintQueueItemStatus.waitingPrinter;
  bool get isSending => status == PrintQueueItemStatus.sending;
  bool get isCompleted =>
      status == PrintQueueItemStatus.sent ||
      status == PrintQueueItemStatus.failed ||
      status == PrintQueueItemStatus.cancelled;

  PrintQueueItem copyWith({
    JobId? id,
    String? printerId,
    String? printerName,
    String? documentName,
    Uint8List? payload,
    int? totalPages,
    String? datatype,
    PrintQueueItemStatus? status,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    int? retryCount,
    String? errorCode,
    String? errorMessage,
    String? lastPrinterStatus,
    String? userId,
    String? username,
    String? documentType,
    String? department,
  }) {
    return PrintQueueItem(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      printerName: printerName ?? this.printerName,
      documentName: documentName ?? this.documentName,
      payload: payload ?? this.payload,
      totalPages: totalPages ?? this.totalPages,
      datatype: datatype ?? this.datatype,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      retryCount: retryCount ?? this.retryCount,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      lastPrinterStatus: lastPrinterStatus ?? this.lastPrinterStatus,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      documentType: documentType ?? this.documentType,
      department: department ?? this.department,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PrintQueueItem && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'PrintQueueItem(${id.value}, $documentName, $status, retry=$retryCount)';
}
