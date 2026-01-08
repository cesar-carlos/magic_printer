import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class LogRepository implements IAppLogRepository {
  final AppDatabase _database;

  LogRepository(this._database);

  @override
  Future<Result<AppLog>> create(AppLog log) async {
    try {
      await _database.into(_database.logs).insert(
            LogsCompanion.insert(
              id: log.id,
              level: log.level.index,
              category: log.category.index,
              title: log.title,
              message: log.message,
              details: Value(log.details),
              printerId: Value(log.printerId),
              hostId: Value(log.hostId),
              jobId: Value(log.jobId),
              createdAt: log.createdAt,
            ),
          );
      return Success(log);
    } catch (e) {
      return Failure(
        StorageException('E_LOG_CREATE_FAILED', 'Failed to create log: $e'),
      );
    }
  }

  @override
  Future<Result<AppLog>> getById(String id) async {
    try {
      final entry = await (_database.select(_database.logs)
            ..where((t) => t.id.equals(id)))
          .getSingleOrNull();

      if (entry == null) {
        return Failure(
          StorageException('E_LOG_NOT_FOUND', 'Log not found: $id'),
        );
      }

      return Success(_mapToEntity(entry));
    } catch (e) {
      return Failure(
        StorageException('E_LOG_GET_FAILED', 'Failed to get log: $e'),
      );
    }
  }

  @override
  Future<Result<List<AppLog>>> getAll({
    AppLogFilters? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      var query = _database.select(_database.logs);

      if (filters != null) {
        query = _applyFilters(query, filters);
      }

      query = query..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

      if (limit != null) {
        query = query..limit(limit, offset: offset);
      }

      final entries = await query.get();
      return Success(entries.map(_mapToEntity).toList());
    } catch (e) {
      return Failure(
        StorageException('E_LOG_GET_ALL_FAILED', 'Failed to get logs: $e'),
      );
    }
  }

  @override
  Future<Result<List<AppLog>>> search(String query, {int? limit}) async {
    try {
      final searchQuery = '%$query%';
      final entries = await (_database.select(_database.logs)
            ..where((t) =>
                t.title.like(searchQuery) |
                t.message.like(searchQuery) |
                t.details.like(searchQuery))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
            ..limit(limit ?? 100))
          .get();

      return Success(entries.map(_mapToEntity).toList());
    } catch (e) {
      return Failure(
        StorageException('E_LOG_SEARCH_FAILED', 'Failed to search logs: $e'),
      );
    }
  }

  @override
  Future<Result<int>> deleteOlderThan(DateTime date) async {
    try {
      final count = await (_database.delete(_database.logs)
            ..where((t) => t.createdAt.isSmallerThanValue(date)))
          .go();
      return Success(count);
    } catch (e) {
      return Failure(
        StorageException('E_LOG_DELETE_FAILED', 'Failed to delete logs: $e'),
      );
    }
  }

  @override
  Future<Result<String>> exportToCsv({AppLogFilters? filters}) async {
    try {
      final result = await getAll(filters: filters);
      if (result.isError()) {
        return Failure(result.exceptionOrNull()!);
      }

      final logs = result.getOrThrow();
      final buffer = StringBuffer();

      buffer.writeln(
        'ID,Level,Category,Title,Message,Details,PrinterID,HostID,JobID,CreatedAt',
      );

      for (final log in logs) {
        buffer.writeln([
          _escapeCsv(log.id),
          _escapeCsv(log.level.name),
          _escapeCsv(log.category.name),
          _escapeCsv(log.title),
          _escapeCsv(log.message),
          _escapeCsv(log.details ?? ''),
          _escapeCsv(log.printerId ?? ''),
          _escapeCsv(log.hostId ?? ''),
          _escapeCsv(log.jobId ?? ''),
          _escapeCsv(log.createdAt.toIso8601String()),
        ].join(','));
      }

      return Success(buffer.toString());
    } catch (e) {
      return Failure(
        StorageException('E_LOG_EXPORT_FAILED', 'Failed to export logs: $e'),
      );
    }
  }

  @override
  Future<Result<String>> exportToJson({AppLogFilters? filters}) async {
    try {
      final result = await getAll(filters: filters);
      if (result.isError()) {
        return Failure(result.exceptionOrNull()!);
      }

      final logs = result.getOrThrow();
      final jsonList = logs.map((log) => {
            'id': log.id,
            'level': log.level.name,
            'category': log.category.name,
            'title': log.title,
            'message': log.message,
            'details': log.details,
            'printerId': log.printerId,
            'hostId': log.hostId,
            'jobId': log.jobId,
            'createdAt': log.createdAt.toIso8601String(),
          }).toList();

      return Success(jsonEncode(jsonList));
    } catch (e) {
      return Failure(
        StorageException('E_LOG_EXPORT_FAILED', 'Failed to export logs: $e'),
      );
    }
  }

  @override
  Stream<AppLog> watchLogs({AppLogFilters? filters}) {
    var query = _database.select(_database.logs);

    if (filters != null) {
      query = _applyFilters(query, filters);
    }

    query = query..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    return query.watch().expand((entries) => entries.map(_mapToEntity));
  }

  SimpleSelectStatement<$LogsTable, LogEntry> _applyFilters(
    SimpleSelectStatement<$LogsTable, LogEntry> query,
    AppLogFilters filters,
  ) {
    if (filters.levels != null && filters.levels!.isNotEmpty) {
      final levelIndices = filters.levels!.map((l) => l.index).toList();
      query = query..where((t) => t.level.isIn(levelIndices));
    }

    if (filters.categories != null && filters.categories!.isNotEmpty) {
      final categoryIndices = filters.categories!.map((c) => c.index).toList();
      query = query..where((t) => t.category.isIn(categoryIndices));
    }

    if (filters.startDate != null) {
      query = query
        ..where((t) => t.createdAt.isBiggerOrEqualValue(filters.startDate!));
    }

    if (filters.endDate != null) {
      query = query
        ..where((t) => t.createdAt.isSmallerOrEqualValue(filters.endDate!));
    }

    if (filters.printerId != null) {
      query = query..where((t) => t.printerId.equals(filters.printerId!));
    }

    if (filters.hostId != null) {
      query = query..where((t) => t.hostId.equals(filters.hostId!));
    }

    if (filters.jobId != null) {
      query = query..where((t) => t.jobId.equals(filters.jobId!));
    }

    return query;
  }

  AppLog _mapToEntity(LogEntry entry) {
    return AppLog(
      id: entry.id,
      level: AppLogLevel.values[entry.level],
      category: AppLogCategory.values[entry.category],
      title: entry.title,
      message: entry.message,
      details: entry.details,
      printerId: entry.printerId,
      hostId: entry.hostId,
      jobId: entry.jobId,
      createdAt: entry.createdAt,
    );
  }

  String _escapeCsv(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
