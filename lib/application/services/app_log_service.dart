import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

class AppLogService {
  final IAppLogRepository _repository;
  final INotificationService _notificationService;
  final _uuid = const Uuid();

  final _logStreamController = StreamController<AppLog>.broadcast();

  AppLogService({
    required IAppLogRepository repository,
    required INotificationService notificationService,
  })  : _repository = repository,
        _notificationService = notificationService;

  Stream<AppLog> get onLogCreated => _logStreamController.stream;

  Future<Result<AppLog>> logDebug({
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) {
    return _log(
      level: AppLogLevel.debug,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
    );
  }

  Future<Result<AppLog>> logInfo({
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) {
    return _log(
      level: AppLogLevel.info,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
    );
  }

  Future<Result<AppLog>> logWarning({
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) {
    return _log(
      level: AppLogLevel.warning,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
    );
  }

  Future<Result<AppLog>> logError({
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) {
    return _log(
      level: AppLogLevel.error,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
    );
  }

  Future<Result<AppLog>> logFatal({
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) {
    return _log(
      level: AppLogLevel.fatal,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
    );
  }

  Future<Result<AppLog>> _log({
    required AppLogLevel level,
    required AppLogCategory category,
    required String title,
    required String message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
  }) async {
    final log = AppLog(
      id: _uuid.v4(),
      level: level,
      category: category,
      title: title,
      message: message,
      details: details,
      printerId: printerId,
      hostId: hostId,
      jobId: jobId,
      createdAt: DateTime.now(),
    );

    final result = await _repository.create(log);

    if (result.isSuccess()) {
      _logStreamController.add(log);

      await _notificationService.notify(log);
    }

    return result;
  }

  Future<Result<List<AppLog>>> getAll({
    AppLogFilters? filters,
    int? limit,
    int? offset,
  }) {
    return _repository.getAll(filters: filters, limit: limit, offset: offset);
  }

  Future<Result<List<AppLog>>> search(String query, {int? limit}) {
    return _repository.search(query, limit: limit);
  }

  Future<Result<int>> deleteOlderThan(DateTime date) {
    return _repository.deleteOlderThan(date);
  }

  Future<Result<String>> exportToCsv({AppLogFilters? filters}) {
    return _repository.exportToCsv(filters: filters);
  }

  Future<Result<String>> exportToJson({AppLogFilters? filters}) {
    return _repository.exportToJson(filters: filters);
  }

  Stream<AppLog> watchLogs({AppLogFilters? filters}) {
    return _repository.watchLogs(filters: filters);
  }

  void dispose() {
    _logStreamController.close();
  }
}
