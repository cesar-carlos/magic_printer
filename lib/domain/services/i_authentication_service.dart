import 'package:result_dart/result_dart.dart';

import '../value_objects/value_objects.dart';

/// Interface para serviço de autenticação
abstract class IAuthenticationService {
  /// Autentica um usuário com credenciais e retorna um token
  Future<Result<Token>> authenticate({
    required String hostId,
    required String username,
    required String password,
  });

  /// Valida se um token é válido
  Future<Result<bool>> validateToken({
    required String hostId,
    required Token token,
  });

  /// Revoga (invalida) um token
  Future<Result<Unit>> revokeToken({
    required String hostId,
    required Token token,
  });

  /// Renova um token existente
  Future<Result<Token>> refreshToken({
    required String hostId,
    required Token token,
  });
}

