import 'package:result_dart/result_dart.dart';

/// Tipo de evento de auditoria
enum AuditEventType {
  authSuccess,
  authFailure,
  accessGranted,
  accessDenied,
  tokenRevoked,
  permissionChanged,
}

/// Evento de auditoria
class AuditEvent {
  final AuditEventType type;
  final String userId;
  final String? targetId;
  final String? details;
  final DateTime timestamp;

  AuditEvent({
    required this.type,
    required this.userId,
    this.targetId,
    this.details,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

/// Interface para serviço de auditoria
abstract class IAuditService {
  /// Registra um evento de auditoria
  Future<Result<Unit>> logEvent(AuditEvent event);

  /// Obtém eventos de auditoria recentes
  Future<Result<List<AuditEvent>>> getRecentEvents({
    int limit = 100,
  });

  /// Obtém eventos de auditoria por usuário
  Future<Result<List<AuditEvent>>> getEventsByUser({
    required String userId,
    int limit = 50,
  });

  /// Obtém eventos de auditoria por tipo
  Future<Result<List<AuditEvent>>> getEventsByType({
    required AuditEventType type,
    int limit = 50,
  });

  /// Limpa eventos antigos
  Future<Result<Unit>> cleanOldEvents({
    required DateTime olderThan,
  });
}
