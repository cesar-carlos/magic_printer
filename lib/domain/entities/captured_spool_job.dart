import 'dart:typed_data';

class CapturedSpoolJob {
  final String printerName;
  final int jobId;
  final String documentName;
  final Uint8List spl;
  final Uint8List? shd;
  final int totalPages;
  final String datatype;

  const CapturedSpoolJob({
    required this.printerName,
    required this.jobId,
    required this.documentName,
    required this.spl,
    required this.shd,
    required this.totalPages,
    required this.datatype,
  });
}


