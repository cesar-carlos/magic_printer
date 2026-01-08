import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class JobMapper {
  static PrintJob toEntity(JobData data) {
    return PrintJob(
      id: JobId(value: data.id),
      documentName: data.documentName,
      printerName: data.printerName,
      hostId: data.hostId,
      status: PrintJobStatus.values[data.status],
      totalSize: data.totalSize,
      sentBytes: data.sentBytes,
      totalChunks: data.totalChunks,
      sentChunks: data.sentChunks,
      totalPages: data.totalPages,
      printedPages: data.printedPages,
      createdAt: data.createdAt,
      startedAt: data.startedAt,
      completedAt: data.completedAt,
      errorCode: data.errorCode,
      errorMessage: data.errorMessage,
    );
  }

  static JobsCompanion toCompanion(PrintJob entity) {
    return JobsCompanion.insert(
      id: entity.id.value,
      documentName: entity.documentName,
      printerName: entity.printerName,
      hostId: Value(entity.hostId),
      status: entity.status.index,
      totalSize: Value(entity.totalSize),
      sentBytes: Value(entity.sentBytes),
      totalChunks: Value(entity.totalChunks),
      sentChunks: Value(entity.sentChunks),
      totalPages: Value(entity.totalPages),
      printedPages: Value(entity.printedPages),
      createdAt: entity.createdAt,
      startedAt: Value(entity.startedAt),
      completedAt: Value(entity.completedAt),
      errorCode: Value(entity.errorCode),
      errorMessage: Value(entity.errorMessage),
    );
  }

  static JobsCompanion toUpdateCompanion(PrintJob entity) {
    return JobsCompanion(
      id: Value(entity.id.value),
      documentName: Value(entity.documentName),
      printerName: Value(entity.printerName),
      hostId: Value(entity.hostId),
      status: Value(entity.status.index),
      totalSize: Value(entity.totalSize),
      sentBytes: Value(entity.sentBytes),
      totalChunks: Value(entity.totalChunks),
      sentChunks: Value(entity.sentChunks),
      totalPages: Value(entity.totalPages),
      printedPages: Value(entity.printedPages),
      startedAt: Value(entity.startedAt),
      completedAt: Value(entity.completedAt),
      errorCode: Value(entity.errorCode),
      errorMessage: Value(entity.errorMessage),
    );
  }
}

