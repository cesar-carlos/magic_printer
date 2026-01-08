import 'package:magic_printer/application/dtos/print_job_dto.dart';
import 'package:magic_printer/domain/domain.dart';

class PrintJobMapper {
  static PrintJobDTO toDTO(PrintJob entity) {
    return PrintJobDTO(
      id: entity.id.value,
      documentName: entity.documentName,
      printerName: entity.printerName,
      hostId: entity.hostId,
      status: _statusToString(entity.status),
      totalSize: entity.totalSize,
      sentBytes: entity.sentBytes,
      totalChunks: entity.totalChunks,
      sentChunks: entity.sentChunks,
      totalPages: entity.totalPages,
      printedPages: entity.printedPages,
      createdAt: entity.createdAt,
      startedAt: entity.startedAt,
      completedAt: entity.completedAt,
      errorCode: entity.errorCode,
      errorMessage: entity.errorMessage,
    );
  }

  static PrintJob toEntity(PrintJobDTO dto) {
    return PrintJob(
      id: JobId(value: dto.id),
      documentName: dto.documentName,
      printerName: dto.printerName,
      hostId: dto.hostId,
      status: _statusFromString(dto.status),
      totalSize: dto.totalSize,
      sentBytes: dto.sentBytes,
      totalChunks: dto.totalChunks,
      sentChunks: dto.sentChunks,
      totalPages: dto.totalPages,
      printedPages: dto.printedPages,
      createdAt: dto.createdAt,
      startedAt: dto.startedAt,
      completedAt: dto.completedAt,
      errorCode: dto.errorCode,
      errorMessage: dto.errorMessage,
    );
  }

  static List<PrintJobDTO> toDTOList(List<PrintJob> entities) {
    return entities.map((e) => toDTO(e)).toList();
  }

  static List<PrintJob> toEntityList(List<PrintJobDTO> dtos) {
    return dtos.map((d) => toEntity(d)).toList();
  }

  static String _statusToString(PrintJobStatus status) {
    switch (status) {
      case PrintJobStatus.pending:
        return 'pending';
      case PrintJobStatus.preparing:
        return 'preparing';
      case PrintJobStatus.sending:
        return 'sending';
      case PrintJobStatus.sent:
        return 'sent';
      case PrintJobStatus.spooled:
        return 'spooled';
      case PrintJobStatus.printing:
        return 'printing';
      case PrintJobStatus.printed:
        return 'printed';
      case PrintJobStatus.failed:
        return 'failed';
      case PrintJobStatus.cancelled:
        return 'cancelled';
    }
  }

  static PrintJobStatus _statusFromString(String status) {
    switch (status) {
      case 'pending':
        return PrintJobStatus.pending;
      case 'preparing':
        return PrintJobStatus.preparing;
      case 'sending':
        return PrintJobStatus.sending;
      case 'sent':
        return PrintJobStatus.sent;
      case 'spooled':
        return PrintJobStatus.spooled;
      case 'printing':
        return PrintJobStatus.printing;
      case 'printed':
        return PrintJobStatus.printed;
      case 'failed':
        return PrintJobStatus.failed;
      case 'cancelled':
        return PrintJobStatus.cancelled;
      default:
        return PrintJobStatus.pending;
    }
  }
}

