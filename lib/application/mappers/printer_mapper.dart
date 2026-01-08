import 'package:magic_printer/application/dtos/printer_dto.dart';
import 'package:magic_printer/domain/domain.dart';

class PrinterMapper {
  static PrinterDTO toDTO(Printer entity) {
    return PrinterDTO(
      id: entity.id,
      name: entity.name,
      alias: entity.alias,
      hostId: entity.hostId,
      location: _locationToString(entity.location),
      status: _statusToString(entity.status),
      driverName: entity.driverName,
      portName: entity.portName,
      locationDescription: entity.locationDescription,
      comment: entity.comment,
      jobCount: entity.jobCount,
      shared: entity.shared,
      allowedGroups: entity.allowedGroups,
      lastSeen: entity.lastSeen,
    );
  }

  static Printer toEntity(PrinterDTO dto) {
    return Printer(
      id: dto.id,
      name: dto.name,
      alias: dto.alias,
      hostId: dto.hostId,
      location: _locationFromString(dto.location),
      status: _statusFromString(dto.status),
      driverName: dto.driverName,
      portName: dto.portName,
      locationDescription: dto.locationDescription,
      comment: dto.comment,
      jobCount: dto.jobCount,
      shared: dto.shared,
      allowedGroups: dto.allowedGroups,
      lastSeen: dto.lastSeen,
    );
  }

  static List<PrinterDTO> toDTOList(List<Printer> entities) {
    return entities.map((e) => toDTO(e)).toList();
  }

  static List<Printer> toEntityList(List<PrinterDTO> dtos) {
    return dtos.map((d) => toEntity(d)).toList();
  }

  static String _locationToString(PrinterLocation location) {
    switch (location) {
      case PrinterLocation.local:
        return 'local';
      case PrinterLocation.remote:
        return 'remote';
    }
  }

  static PrinterLocation _locationFromString(String location) {
    switch (location) {
      case 'local':
        return PrinterLocation.local;
      case 'remote':
        return PrinterLocation.remote;
      default:
        return PrinterLocation.local;
    }
  }

  static String _statusToString(PrinterStatus status) {
    switch (status) {
      case PrinterStatus.online:
        return 'online';
      case PrinterStatus.offline:
        return 'offline';
      case PrinterStatus.error:
        return 'error';
      case PrinterStatus.paused:
        return 'paused';
      case PrinterStatus.printing:
        return 'printing';
      case PrinterStatus.unknown:
        return 'unknown';
    }
  }

  static PrinterStatus _statusFromString(String status) {
    switch (status) {
      case 'online':
        return PrinterStatus.online;
      case 'offline':
        return PrinterStatus.offline;
      case 'error':
        return PrinterStatus.error;
      case 'paused':
        return PrinterStatus.paused;
      case 'printing':
        return PrinterStatus.printing;
      case 'unknown':
        return PrinterStatus.unknown;
      default:
        return PrinterStatus.unknown;
    }
  }
}

