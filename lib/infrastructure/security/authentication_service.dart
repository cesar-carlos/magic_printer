import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

class AuthenticationService implements IAuthenticationService {
  final IHostRepository _hostRepository;
  final IAuditService _auditService;
  final Uuid _uuid = const Uuid();

  AuthenticationService({
    required IHostRepository hostRepository,
    required IAuditService auditService,
  }) : _hostRepository = hostRepository,
       _auditService = auditService;

  @override
  Future<Result<Token>> authenticate({
    required String hostId,
    required String username,
    required String password,
  }) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        await _auditService.logEvent(
          AuditEvent(
            type: AuditEventType.authFailure,
            userId: username,
            targetId: hostId,
            details: 'Empty credentials',
          ),
        );
        return Failure(
          const AuthException(
            'E_AUTH_INVALID_CREDENTIALS',
            'Username and password cannot be empty',
          ),
        );
      }

      final tokenResult = await _hostRepository.authenticate(
        hostId,
        username,
        password,
      );

      if (tokenResult.isError()) {
        await _auditService.logEvent(
          AuditEvent(
            type: AuditEventType.authFailure,
            userId: username,
            targetId: hostId,
            details: tokenResult.exceptionOrNull()?.toString() ?? 'Auth failed',
          ),
        );
        return tokenResult;
      }

      await _auditService.logEvent(
        AuditEvent(
          type: AuditEventType.authSuccess,
          userId: username,
          targetId: hostId,
          details: 'Token validated successfully',
        ),
      );

      return tokenResult;
    } catch (e) {
      return Failure(
        AuthException(
          'E_AUTH_UNEXPECTED',
          'Authentication failed: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<bool>> validateToken({
    required String hostId,
    required Token token,
  }) async {
    try {
      final hostResult = await _hostRepository.getById(hostId);
      if (hostResult.isError()) {
        return hostResult.exceptionOrNull()!.toFailure();
      }

      final host = hostResult.getOrThrow();

      // Verifica se o host tem token
      if (host.token == null) {
        return Success(false);
      }

      // Verifica se o token é o mesmo
      if (host.token!.value != token.value) {
        return Success(false);
      }

      // Verifica se o token expirou
      if (host.token!.isExpired) {
        return Success(false);
      }

      return Success(true);
    } catch (e) {
      return Failure(
        AuthException(
          'E_AUTH_VALIDATION_FAILED',
          'Token validation failed: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<Unit>> revokeToken({
    required String hostId,
    required Token token,
  }) async {
    try {
      final hostResult = await _hostRepository.getById(hostId);
      if (hostResult.isError()) {
        return hostResult.exceptionOrNull()!.toFailure();
      }

      final host = hostResult.getOrThrow();
      final updatedHost = host.copyWith(token: null);
      await _hostRepository.update(updatedHost);

      // Registrar revogação
      await _auditService.logEvent(
        AuditEvent(
          type: AuditEventType.tokenRevoked,
          userId: 'system',
          targetId: hostId,
          details: 'Token revoked',
        ),
      );

      return Success(unit);
    } catch (e) {
      return Failure(
        AuthException(
          'E_AUTH_REVOKE_FAILED',
          'Token revocation failed: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<Token>> refreshToken({
    required String hostId,
    required Token token,
  }) async {
    try {
      // Validar token atual
      final validationResult = await validateToken(
        hostId: hostId,
        token: token,
      );

      if (validationResult.isError()) {
        return validationResult.exceptionOrNull()!.toFailure();
      }

      if (!validationResult.getOrThrow()) {
        return Failure(
          const AuthException(
            'E_AUTH_INVALID_TOKEN',
            'Invalid or expired token',
          ),
        );
      }

      // Gerar novo token
      final newToken = Token(
        value: _uuid.v4(),
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
      );

      // Atualizar host
      final hostResult = await _hostRepository.getById(hostId);
      if (hostResult.isError()) {
        return hostResult.exceptionOrNull()!.toFailure();
      }

      final host = hostResult.getOrThrow();
      final updatedHost = host.copyWith(token: newToken);
      await _hostRepository.update(updatedHost);

      return Success(newToken);
    } catch (e) {
      return Failure(
        AuthException(
          'E_AUTH_REFRESH_FAILED',
          'Token refresh failed: ${e.toString()}',
        ),
      );
    }
  }
}
