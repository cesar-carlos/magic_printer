import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/windows_user_service.dart';
import '../../domain/domain.dart';

class UserService implements IUserService {
  final IUserRepository _userRepository;

  UserService({
    required IUserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<Result<User>> getCurrentUser() async {
    final username = WindowsUserService.getCurrentUsername();
    if (username == null) {
      return Failure(
        StorageException('E_USER_NOT_FOUND', 'Não foi possível obter o usuário atual'),
      );
    }

    final result = await _userRepository.getByUsername(username);
    if (result.isSuccess()) {
      return result;
    }

    return await createOrUpdateUser(username: username);
  }

  @override
  Future<Result<List<User>>> getAllUsers() async {
    return await _userRepository.getAll();
  }

  @override
  Future<Result<Unit>> syncWithWindowsUsers() async {
    try {
      final currentUsername = WindowsUserService.getCurrentUsername();
      if (currentUsername == null) {
        return Failure(
          StorageException('E_SYNC_FAILED', 'Não foi possível obter o usuário atual'),
        );
      }

      final existingResult = await _userRepository.getByUsername(currentUsername);
      if (existingResult.isError()) {
        await createOrUpdateUser(username: currentUsername);
      } else {
        final user = existingResult.getOrThrow();
        await _userRepository.updateLastSeen(user.id);
      }

      return const Success(unit);
    } catch (e) {
      return Failure(
        StorageException('E_SYNC_FAILED', 'Erro ao sincronizar usuários: $e'),
      );
    }
  }

  @override
  Future<Result<User>> createOrUpdateUser({
    required String username,
    String? displayName,
    String? department,
    String? email,
  }) async {
    try {
      final existingResult = await _userRepository.getByUsername(username);

      if (existingResult.isSuccess()) {
        final existingUser = existingResult.getOrThrow();
        final updated = existingUser.copyWith(
          displayName: displayName ?? existingUser.displayName,
          department: department ?? existingUser.department,
          email: email ?? existingUser.email,
          lastSeen: DateTime.now(),
        );
        return await _userRepository.update(updated);
      }

      const uuid = Uuid();
      final newUser = User(
        id: uuid.v4(),
        username: username,
        displayName: displayName,
        department: department,
        email: email,
        createdAt: DateTime.now(),
        lastSeen: DateTime.now(),
      );

      return await _userRepository.create(newUser);
    } catch (e) {
      return Failure(
        StorageException('E_USER_CREATE_FAILED', 'Erro ao criar/atualizar usuário: $e'),
      );
    }
  }
}
