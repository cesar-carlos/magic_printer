import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';

/// Implementação do serviço de auditoria
/// 
/// MVP: Log em memória + Logger do sistema
/// Futuro: Persistir em SQLite para histórico
class AuditService implements IAuditService {
  final Logger _logger;
  final List<AuditEvent> _events = [];
  final int _maxEventsInMemory = 1000;

  AuditService({required Logger logger}) : _logger = logger;

  @override
  Future<Result<Unit>> logEvent(AuditEvent event) async {
    try {
      // Adicionar à lista em memória
      _events.add(event);

      // Limitar tamanho da lista
      if (_events.length > _maxEventsInMemory) {
        _events.removeAt(0);
      }

      // Log no sistema
      final logMessage = _formatEventMessage(event);
      
      switch (event.type) {
        case AuditEventType.authFailure:
        case AuditEventType.accessDenied:
          _logger.w(logMessage);
          break;
        case AuditEventType.authSuccess:
        case AuditEventType.accessGranted:
          _logger.i(logMessage);
          break;
        case AuditEventType.tokenRevoked:
        case AuditEventType.permissionChanged:
          _logger.d(logMessage);
          break;
      }

      return Success(unit);
    } catch (e) {
      return Failure(
        StorageException(
          'E_AUDIT_LOG_FAILED',
          'Failed to log audit event: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<List<AuditEvent>>> getRecentEvents({
    int limit = 100,
  }) async {
    try {
      final events = _events.reversed.take(limit).toList();
      return Success(events);
    } catch (e) {
      return Failure(
        StorageException(
          'E_AUDIT_GET_FAILED',
          'Failed to get audit events: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<List<AuditEvent>>> getEventsByUser({
    required String userId,
    int limit = 50,
  }) async {
    try {
      final events = _events
          .where((event) => event.userId == userId)
          .toList()
          .reversed
          .take(limit)
          .toList();
      return Success(events);
    } catch (e) {
      return Failure(
        StorageException(
          'E_AUDIT_GET_BY_USER_FAILED',
          'Failed to get audit events by user: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<List<AuditEvent>>> getEventsByType({
    required AuditEventType type,
    int limit = 50,
  }) async {
    try {
      final events = _events
          .where((event) => event.type == type)
          .toList()
          .reversed
          .take(limit)
          .toList();
      return Success(events);
    } catch (e) {
      return Failure(
        StorageException(
          'E_AUDIT_GET_BY_TYPE_FAILED',
          'Failed to get audit events by type: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<Unit>> cleanOldEvents({
    required DateTime olderThan,
  }) async {
    try {
      _events.removeWhere((event) => event.timestamp.isBefore(olderThan));
      return Success(unit);
    } catch (e) {
      return Failure(
        StorageException(
          'E_AUDIT_CLEAN_FAILED',
          'Failed to clean old audit events: ${e.toString()}',
        ),
      );
    }
  }

  /// Formata um evento de auditoria para log
  String _formatEventMessage(AuditEvent event) {
    final buffer = StringBuffer();
    buffer.write('[AUDIT] ${event.type.name.toUpperCase()}');
    buffer.write(' | User: ${event.userId}');
    
    if (event.targetId != null) {
      buffer.write(' | Target: ${event.targetId}');
    }
    
    if (event.details != null) {
      buffer.write(' | ${event.details}');
    }
    
    return buffer.toString();
  }
}
