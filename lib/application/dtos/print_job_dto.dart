class PrintJobDTO {
  final String id;
  final String documentName;
  final String printerName;
  final String? hostId;
  final String status;
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

  const PrintJobDTO({
    required this.id,
    required this.documentName,
    required this.printerName,
    this.hostId,
    required this.status,
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
  });

  double get progress {
    if (totalChunks == 0) return 0;
    return sentChunks / totalChunks;
  }

  bool get isComplete => status == 'printed' || status == 'sent';
  bool get isFailed => status == 'failed';
  bool get isCancelled => status == 'cancelled';
  bool get isInProgress =>
      status == 'preparing' ||
      status == 'sending' ||
      status == 'spooled' ||
      status == 'printing';

  Duration? get duration {
    if (startedAt == null) return null;
    final end = completedAt ?? DateTime.now();
    return end.difference(startedAt!);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'documentName': documentName,
      'printerName': printerName,
      'hostId': hostId,
      'status': status,
      'totalSize': totalSize,
      'sentBytes': sentBytes,
      'totalChunks': totalChunks,
      'sentChunks': sentChunks,
      'totalPages': totalPages,
      'printedPages': printedPages,
      'createdAt': createdAt.toIso8601String(),
      'startedAt': startedAt?.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'errorCode': errorCode,
      'errorMessage': errorMessage,
    };
  }

  factory PrintJobDTO.fromJson(Map<String, dynamic> json) {
    return PrintJobDTO(
      id: json['id'] as String,
      documentName: json['documentName'] as String,
      printerName: json['printerName'] as String,
      hostId: json['hostId'] as String?,
      status: json['status'] as String,
      totalSize: json['totalSize'] as int? ?? 0,
      sentBytes: json['sentBytes'] as int? ?? 0,
      totalChunks: json['totalChunks'] as int? ?? 0,
      sentChunks: json['sentChunks'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      printedPages: json['printedPages'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] != null
          ? DateTime.parse(json['startedAt'] as String)
          : null,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );
  }
}

