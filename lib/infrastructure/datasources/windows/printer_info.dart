class PrinterInfoData {
  final String name;
  final String? serverName;
  final String? shareName;
  final String? portName;
  final String? driverName;
  final String? comment;
  final String? location;
  final int status;
  final int jobCount;
  final int attributes;

  const PrinterInfoData({
    required this.name,
    this.serverName,
    this.shareName,
    this.portName,
    this.driverName,
    this.comment,
    this.location,
    required this.status,
    required this.jobCount,
    required this.attributes,
  });

  bool get isOffline => (status & 0x00000080) != 0;
  bool get isPaused => (status & 0x00000001) != 0;
  bool get hasError => (status & 0x00000002) != 0;
  bool get isPrinting => (status & 0x00000400) != 0;

  String get statusDescription {
    if (isOffline) return 'Offline';
    if (hasError) return 'Erro';
    if (isPaused) return 'Pausada';
    if (isPrinting) return 'Imprimindo';
    if (jobCount > 0) return 'Com jobs ($jobCount)';
    return 'Online';
  }

  @override
  String toString() => 'PrinterInfo($name, status: $statusDescription)';
}

class PrintJobInfo {
  final int jobId;
  final String printerName;
  final String? machineName;
  final String? userName;
  final String? documentName;
  final String? datatype;
  final int status;
  final int totalPages;
  final int pagesPrinted;
  final int size;
  final DateTime? submittedAt;

  const PrintJobInfo({
    required this.jobId,
    required this.printerName,
    this.machineName,
    this.userName,
    this.documentName,
    this.datatype,
    required this.status,
    required this.totalPages,
    required this.pagesPrinted,
    required this.size,
    this.submittedAt,
  });

  bool get isSpooling => (status & 0x00000008) != 0;
  bool get isPrinting => (status & 0x00000010) != 0;
  bool get isPaused => (status & 0x00000001) != 0;
  bool get hasError => (status & 0x00000002) != 0;
  bool get isDeleting => (status & 0x00000004) != 0;
  bool get isComplete => (status & 0x00001000) != 0;
  bool get isPrinted => (status & 0x00000080) != 0;

  String get statusDescription {
    if (isDeleting) return 'Excluindo';
    if (hasError) return 'Erro';
    if (isPaused) return 'Pausado';
    if (isPrinting) return 'Imprimindo';
    if (isSpooling) return 'Spooling';
    if (isComplete || isPrinted) return 'Concluído';
    return 'Aguardando';
  }

  String get splFileName => '${jobId.toString().padLeft(5, '0')}.SPL';
  String get shdFileName => '${jobId.toString().padLeft(5, '0')}.SHD';

  @override
  String toString() =>
      'PrintJob($jobId, $documentName, status: $statusDescription)';
}
