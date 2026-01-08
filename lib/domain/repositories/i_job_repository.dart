import 'package:result_dart/result_dart.dart';

import '../entities/print_job.dart';
import '../value_objects/job_id.dart';

abstract class IJobRepository {
  Future<Result<List<PrintJob>>> getAll();

  Future<Result<List<PrintJob>>> getRecent({int limit = 50});

  Future<Result<List<PrintJob>>> getByStatus(PrintJobStatus status);

  Future<Result<PrintJob>> getById(JobId id);

  Future<Result<PrintJob>> create(PrintJob job);

  Future<Result<PrintJob>> update(PrintJob job);

  Future<Result<Unit>> delete(JobId id);

  Future<Result<Unit>> deleteOlderThan(DateTime date);
}
