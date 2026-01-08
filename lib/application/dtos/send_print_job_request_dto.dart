import 'dart:typed_data';

class SendPrintJobRequestDTO {
  final String printerId;
  final String documentName;
  final Uint8List payload;
  final int totalPages;
  final String datatype;

  const SendPrintJobRequestDTO({
    required this.printerId,
    required this.documentName,
    required this.payload,
    this.totalPages = 0,
    this.datatype = 'RAW',
  });

  Map<String, dynamic> toJson() {
    return {
      'printerId': printerId,
      'documentName': documentName,
      'payload': payload,
      'totalPages': totalPages,
      'datatype': datatype,
    };
  }

  factory SendPrintJobRequestDTO.fromJson(Map<String, dynamic> json) {
    return SendPrintJobRequestDTO(
      printerId: json['printerId'] as String,
      documentName: json['documentName'] as String,
      payload: json['payload'] as Uint8List,
      totalPages: json['totalPages'] as int? ?? 0,
      datatype: json['datatype'] as String? ?? 'RAW',
    );
  }
}

