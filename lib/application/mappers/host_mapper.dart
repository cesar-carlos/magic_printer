import 'package:magic_printer/application/dtos/host_dto.dart';
import 'package:magic_printer/domain/domain.dart';

class HostMapper {
  static HostDTO toDTO(Host entity) {
    return HostDTO(
      id: entity.id,
      name: entity.name,
      host: entity.address.host,
      port: entity.address.port,
      status: _statusToString(entity.status),
      requiresAuth: entity.requiresAuth,
      token: entity.token?.value,
      lastSeen: entity.lastSeen,
      supportedFeatures: entity.supportedFeatures,
      version: entity.version,
    );
  }

  static Host toEntity(HostDTO dto) {
    return Host(
      id: dto.id,
      name: dto.name,
      address: HostAddress(host: dto.host, port: dto.port),
      status: _statusFromString(dto.status),
      requiresAuth: dto.requiresAuth,
      token: dto.token != null ? Token(value: dto.token!) : null,
      lastSeen: dto.lastSeen,
      supportedFeatures: dto.supportedFeatures,
      version: dto.version,
    );
  }

  static List<HostDTO> toDTOList(List<Host> entities) {
    return entities.map((e) => toDTO(e)).toList();
  }

  static List<Host> toEntityList(List<HostDTO> dtos) {
    return dtos.map((d) => toEntity(d)).toList();
  }

  static String _statusToString(HostStatus status) {
    switch (status) {
      case HostStatus.online:
        return 'online';
      case HostStatus.offline:
        return 'offline';
      case HostStatus.connecting:
        return 'connecting';
      case HostStatus.error:
        return 'error';
    }
  }

  static HostStatus _statusFromString(String status) {
    switch (status) {
      case 'online':
        return HostStatus.online;
      case 'offline':
        return HostStatus.offline;
      case 'connecting':
        return HostStatus.connecting;
      case 'error':
        return HostStatus.error;
      default:
        return HostStatus.offline;
    }
  }
}

