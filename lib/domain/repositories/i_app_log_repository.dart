import 'package:result_dart/result_dart.dart';

import '../entities/app_log.dart';

class AppLogFilters {
  final List<AppLogLevel>? levels;
  final List<AppLogCategory>? categories;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? printerId;
  final String? hostId;
  final String? jobId;

  const AppLogFilters({
    this.levels,
    this.categories,
    this.startDate,
    this.endDate,
    this.printerId,
    this.hostId,
    this.jobId,
  });
}

abstract class IAppLogRepository {
  Future<Result<AppLog>> create(AppLog log);

  Future<Result<AppLog>> getById(String id);

  Future<Result<List<AppLog>>> getAll({
    AppLogFilters? filters,
    int? limit,
    int? offset,
  });

  Future<Result<List<AppLog>>> search(String query, {int? limit});

  Future<Result<int>> deleteOlderThan(DateTime date);

  Future<Result<String>> exportToCsv({AppLogFilters? filters});

  Future<Result<String>> exportToJson({AppLogFilters? filters});

  Stream<AppLog> watchLogs({AppLogFilters? filters});
}
