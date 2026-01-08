import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';

/// Implementação do serviço de autorização
class AuthorizationService implements IAuthorizationService {
  final IGroupRepository _groupRepository;
  final IPrinterRepository _printerRepository;
  final IAuditService _auditService;

  AuthorizationService({
    required IGroupRepository groupRepository,
    required IPrinterRepository printerRepository,
    required IAuditService auditService,
  })  : _groupRepository = groupRepository,
        _printerRepository = printerRepository,
        _auditService = auditService;

  @override
  Future<Result<bool>> canAccessPrinter({
    required String userId,
    required String printerId,
  }) async {
    try {
      // Obter impressora
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) {
        return printerResult.exceptionOrNull()!.toFailure();
      }

      final printer = printerResult.getOrThrow();

      // Se a impressora não tem grupos permitidos, todos podem acessar
      if (printer.allowedGroups.isEmpty) {
        await _auditService.logEvent(
          AuditEvent(
            type: AuditEventType.accessGranted,
            userId: userId,
            targetId: printerId,
            details: 'No restrictions',
          ),
        );
        return Success(true);
      }

      // Obter grupos do usuário
      final userGroupsResult = await getUserGroups(userId: userId);
      if (userGroupsResult.isError()) {
        return userGroupsResult.exceptionOrNull()!.toFailure();
      }

      final userGroups = userGroupsResult.getOrThrow();

      // Verificar se o usuário está em algum dos grupos permitidos
      final hasAccess = userGroups.any(
        (groupId) => printer.allowedGroups.contains(groupId),
      );

      if (hasAccess) {
        await _auditService.logEvent(
          AuditEvent(
            type: AuditEventType.accessGranted,
            userId: userId,
            targetId: printerId,
            details: 'User in allowed group',
          ),
        );
      } else {
        await _auditService.logEvent(
          AuditEvent(
            type: AuditEventType.accessDenied,
            userId: userId,
            targetId: printerId,
            details: 'User not in allowed group',
          ),
        );
      }

      return Success(hasAccess);
    } catch (e) {
      return Failure(
        PermissionException('Access check failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<bool>> hasPermission({
    required String userId,
    required String permission,
  }) async {
    try {
      final permissionsResult = await getUserPermissions(userId: userId);
      if (permissionsResult.isError()) {
        return permissionsResult.exceptionOrNull()!.toFailure();
      }

      final permissions = permissionsResult.getOrThrow();
      return Success(permissions.contains(permission));
    } catch (e) {
      return Failure(
        PermissionException('Permission check failed: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<List<String>>> getUserPermissions({
    required String userId,
  }) async {
    try {
      final groupsResult = await getUserGroups(userId: userId);
      if (groupsResult.isError()) {
        return groupsResult.exceptionOrNull()!.toFailure();
      }

      final groupIds = groupsResult.getOrThrow();
      final allPermissions = <String>{};

      for (final groupId in groupIds) {
        final groupResult = await _groupRepository.getById(groupId);
        if (groupResult.isSuccess()) {
          final group = groupResult.getOrThrow();
          allPermissions.addAll(group.permissions);
        }
      }

      return Success(allPermissions.toList());
    } catch (e) {
      return Failure(
        PermissionException('Failed to get user permissions: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<List<String>>> getUserGroups({
    required String userId,
  }) async {
    try {
      final allGroupsResult = await _groupRepository.getAll();
      if (allGroupsResult.isError()) {
        return allGroupsResult.exceptionOrNull()!.toFailure();
      }

      final allGroups = allGroupsResult.getOrThrow();
      final userGroups = allGroups
          .where((group) => group.memberIds.contains(userId))
          .map((group) => group.id)
          .toList();

      return Success(userGroups);
    } catch (e) {
      return Failure(
        PermissionException('Failed to get user groups: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Unit>> addUserToGroup({
    required String userId,
    required String groupId,
  }) async {
    try {
      final groupResult = await _groupRepository.getById(groupId);
      if (groupResult.isError()) {
        return groupResult.exceptionOrNull()!.toFailure();
      }

      final group = groupResult.getOrThrow();

      // Verificar se já está no grupo
      if (group.memberIds.contains(userId)) {
        return Success(unit);
      }

      // Adicionar usuário
      final updatedGroup = group.copyWith(
        memberIds: [...group.memberIds, userId],
      );

      final updateResult = await _groupRepository.update(updatedGroup);
      if (updateResult.isError()) {
        return updateResult.exceptionOrNull()!.toFailure();
      }

      // Registrar mudança
      await _auditService.logEvent(
        AuditEvent(
          type: AuditEventType.permissionChanged,
          userId: userId,
          targetId: groupId,
          details: 'User added to group',
        ),
      );

      return Success(unit);
    } catch (e) {
      return Failure(
        PermissionException('Failed to add user to group: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<Unit>> removeUserFromGroup({
    required String userId,
    required String groupId,
  }) async {
    try {
      final groupResult = await _groupRepository.getById(groupId);
      if (groupResult.isError()) {
        return groupResult.exceptionOrNull()!.toFailure();
      }

      final group = groupResult.getOrThrow();

      // Verificar se está no grupo
      if (!group.memberIds.contains(userId)) {
        return Success(unit);
      }

      // Remover usuário
      final updatedGroup = group.copyWith(
        memberIds: group.memberIds.where((id) => id != userId).toList(),
      );

      final updateResult = await _groupRepository.update(updatedGroup);
      if (updateResult.isError()) {
        return updateResult.exceptionOrNull()!.toFailure();
      }

      // Registrar mudança
      await _auditService.logEvent(
        AuditEvent(
          type: AuditEventType.permissionChanged,
          userId: userId,
          targetId: groupId,
          details: 'User removed from group',
        ),
      );

      return Success(unit);
    } catch (e) {
      return Failure(
        PermissionException('Failed to remove user from group: ${e.toString()}'),
      );
    }
  }
}
