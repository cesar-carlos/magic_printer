import '../../../domain/domain.dart';
import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../app_database.dart';
import '../mappers/mappers.dart';

class JobRepository implements IJobRepository {
  final AppDatabase _db;

  JobRepository(this._db);

  @override
  Future<Result<List<PrintJob>>> getAll() async {
    try {
      final data = await _db.select(_db.jobs).get();
      final jobs = data.map(JobMapper.toEntity).toList();
      return Success(jobs);
    } catch (e) {
      return StorageException.readFailed('jobs').toFailure();
    }
  }

  @override
  Future<Result<List<PrintJob>>> getRecent({int limit = 50}) async {
    try {
      final data = await (_db.select(_db.jobs)
            ..orderBy([
              (tbl) => OrderingTerm(
                    expression: tbl.createdAt,
                    mode: OrderingMode.desc,
                  )
            ])
            ..limit(limit))
          .get();
      final jobs = data.map(JobMapper.toEntity).toList();
      return Success(jobs);
    } catch (e) {
      return StorageException.readFailed('recent jobs').toFailure();
    }
  }

  @override
  Future<Result<List<PrintJob>>> getByStatus(PrintJobStatus status) async {
    try {
      final data = await (_db.select(_db.jobs)
            ..where((tbl) => tbl.status.equals(status.index)))
          .get();
      final jobs = data.map(JobMapper.toEntity).toList();
      return Success(jobs);
    } catch (e) {
      return StorageException.readFailed('jobs with status: $status')
          .toFailure();
    }
  }

  @override
  Future<Result<PrintJob>> getById(JobId id) async {
    try {
      final data = await (_db.select(_db.jobs)
            ..where((tbl) => tbl.id.equals(id.value)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('job: ${id.value}').toFailure();
      }

      return Success(JobMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('job: ${id.value}').toFailure();
    }
  }

  @override
  Future<Result<PrintJob>> create(PrintJob job) async {
    try {
      await _db.into(_db.jobs).insert(JobMapper.toCompanion(job));
      return Success(job);
    } catch (e) {
      return StorageException.writeFailed('job: ${job.id.value}').toFailure();
    }
  }

  @override
  Future<Result<PrintJob>> update(PrintJob job) async {
    try {
      await _db.update(_db.jobs).replace(JobMapper.toCompanion(job));
      return Success(job);
    } catch (e) {
      return StorageException.writeFailed('job: ${job.id.value}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(JobId id) async {
    try {
      await (_db.delete(_db.jobs)..where((tbl) => tbl.id.equals(id.value)))
          .go();
      return Success(unit);
    } catch (e) {
      return StorageException.writeFailed('job: ${id.value}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> deleteOlderThan(DateTime date) async {
    try {
      await (_db.delete(_db.jobs)
            ..where((tbl) => tbl.createdAt.isSmallerThanValue(date)))
          .go();
      return Success(unit);
    } catch (e) {
      return StorageException.writeFailed(
        'jobs older than $date',
      ).toFailure();
    }
  }
}

