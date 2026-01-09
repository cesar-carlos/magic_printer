import '../value_objects/job_id.dart';

enum PrintJobStatus {
  pending,
  preparing,
  sending,
  sent,
  spooled,
  printing,
  printed,
  failed,
  cancelled,
}

class PrintJob {
  final JobId id;
  final String documentName;
  final String printerName;
  final String? hostId;
  final PrintJobStatus status;
  final int totalSize;
  final int sentBytes;
  final int totalChunks;
  final int sentChunks;
  final int totalPages;
  final int printedPages;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String? errorCode;
  final String? errorMessage;
  final String? userId;
  final String? username;
  final String? documentType;
  final String? department;
  final int? estimatedCost;

  const PrintJob({
    required this.id,
    required this.documentName,
    required this.printerName,
    this.hostId,
    this.status = PrintJobStatus.pending,
    this.totalSize = 0,
    this.sentBytes = 0,
    this.totalChunks = 0,
    this.sentChunks = 0,
    this.totalPages = 0,
    this.printedPages = 0,
    required this.createdAt,
    this.startedAt,
    this.completedAt,
    this.errorCode,
    this.errorMessage,
    this.userId,
    this.username,
    this.documentType,
    this.department,
    this.estimatedCost,
  });

  double get progress {
    if (totalChunks == 0) return 0;
    return sentChunks / totalChunks;
  }

  bool get isComplete =>
      status == PrintJobStatus.printed || status == PrintJobStatus.sent;

  bool get isFailed => status == PrintJobStatus.failed;
  bool get isCancelled => status == PrintJobStatus.cancelled;
  bool get isInProgress =>
      status == PrintJobStatus.preparing ||
      status == PrintJobStatus.sending ||
      status == PrintJobStatus.spooled ||
      status == PrintJobStatus.printing;

  Duration? get duration {
    if (startedAt == null) return null;
    final end = completedAt ?? DateTime.now();
    return end.difference(startedAt!);
  }

  String get statusDescription {
    switch (status) {
      case PrintJobStatus.pending:
        return 'Pendente';
      case PrintJobStatus.preparing:
        return 'Preparando';
      case PrintJobStatus.sending:
        return 'Enviando (${(progress * 100).toStringAsFixed(0)}%)';
      case PrintJobStatus.sent:
        return 'Enviado';
      case PrintJobStatus.spooled:
        return 'Na fila';
      case PrintJobStatus.printing:
        return 'Imprimindo';
      case PrintJobStatus.printed:
        return 'Impresso';
      case PrintJobStatus.failed:
        return 'Falha';
      case PrintJobStatus.cancelled:
        return 'Cancelado';
    }
  }

  PrintJob copyWith({
    JobId? id,
    String? documentName,
    String? printerName,
    String? hostId,
    PrintJobStatus? status,
    int? totalSize,
    int? sentBytes,
    int? totalChunks,
    int? sentChunks,
    int? totalPages,
    int? printedPages,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    String? errorCode,
    String? errorMessage,
    String? userId,
    String? username,
    String? documentType,
    String? department,
    int? estimatedCost,
  }) {
    return PrintJob(
      id: id ?? this.id,
      documentName: documentName ?? this.documentName,
      printerName: printerName ?? this.printerName,
      hostId: hostId ?? this.hostId,
      status: status ?? this.status,
      totalSize: totalSize ?? this.totalSize,
      sentBytes: sentBytes ?? this.sentBytes,
      totalChunks: totalChunks ?? this.totalChunks,
      sentChunks: sentChunks ?? this.sentChunks,
      totalPages: totalPages ?? this.totalPages,
      printedPages: printedPages ?? this.printedPages,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      documentType: documentType ?? this.documentType,
      department: department ?? this.department,
      estimatedCost: estimatedCost ?? this.estimatedCost,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PrintJob && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'PrintJob(${id.value}, $documentName, $status)';
}

