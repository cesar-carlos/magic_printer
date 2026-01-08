import 'package:result_dart/result_dart.dart';

/// Interface para serviço de autorização
abstract class IAuthorizationService {
  /// Verifica se um usuário tem permissão para acessar uma impressora
  Future<Result<bool>> canAccessPrinter({
    required String userId,
    required String printerId,
  });

  /// Verifica se um usuário tem uma permissão específica
  Future<Result<bool>> hasPermission({
    required String userId,
    required String permission,
  });

  /// Obtém todas as permissões de um usuário
  Future<Result<List<String>>> getUserPermissions({
    required String userId,
  });

  /// Obtém os grupos de um usuário
  Future<Result<List<String>>> getUserGroups({
    required String userId,
  });

  /// Adiciona um usuário a um grupo
  Future<Result<Unit>> addUserToGroup({
    required String userId,
    required String groupId,
  });

  /// Remove um usuário de um grupo
  Future<Result<Unit>> removeUserFromGroup({
    required String userId,
    required String groupId,
  });
}

