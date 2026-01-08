import 'package:result_dart/result_dart.dart' hide Failure;

import '../entities/print_job.dart';
import '../repositories/i_job_repository.dart';

class GetJobHistory {
  final IJobRepository _jobRepository;

  GetJobHistory({required IJobRepository jobRepository})
      : _jobRepository = jobRepository;

  Future<Result<List<PrintJob>>> call({int limit = 50}) async {
    return _jobRepository.getRecent(limit: limit);
  }

  Future<Result<List<PrintJob>>> getPending() async {
    return _jobRepository.getByStatus(PrintJobStatus.pending);
  }

  Future<Result<List<PrintJob>>> getInProgress() async {
    final sendingResult =
        await _jobRepository.getByStatus(PrintJobStatus.sending);
    final spooledResult =
        await _jobRepository.getByStatus(PrintJobStatus.spooled);
    final printingResult =
        await _jobRepository.getByStatus(PrintJobStatus.printing);

    final jobs = <PrintJob>[];

    if (sendingResult.isSuccess()) {
      jobs.addAll(sendingResult.getOrThrow());
    }
    if (spooledResult.isSuccess()) {
      jobs.addAll(spooledResult.getOrThrow());
    }
    if (printingResult.isSuccess()) {
      jobs.addAll(printingResult.getOrThrow());
    }

    jobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return Success(jobs);
  }

  Future<Result<List<PrintJob>>> getFailed() async {
    return _jobRepository.getByStatus(PrintJobStatus.failed);
  }

  Future<Result<Unit>> cleanOldJobs({int daysToKeep = 30}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysToKeep));
    return _jobRepository.deleteOlderThan(cutoffDate);
  }
}
