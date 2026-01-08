import 'package:result_dart/result_dart.dart';

import '../entities/app_log.dart';

enum NotificationType {
  local,
  email,
  both,
}

abstract class INotificationService {
  Future<Result<Unit>> notifyLocal(AppLog log);

  Future<Result<Unit>> notifyEmail(
    AppLog log, {
    required Future<bool> Function() confirmCallback,
  });

  Future<Result<Unit>> notify(
    AppLog log, {
    NotificationType type = NotificationType.local,
    Future<bool> Function()? confirmCallback,
  });

  bool shouldNotifyByEmail(AppLog log);
}
