import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../dtos/print_job_dto.dart';
import '../dtos/send_print_job_request_dto.dart';
import '../mappers/print_job_mapper.dart';

class PrintJobService {
  final SendPrintJob _sendPrintJob;
  final GetJobHistory _getJobHistory;
  final IJobRepository _jobRepository;

  PrintJobService({
    required SendPrintJob sendPrintJob,
    required GetJobHistory getJobHistory,
    required IJobRepository jobRepository,
  })  : _sendPrintJob = sendPrintJob,
        _getJobHistory = getJobHistory,
        _jobRepository = jobRepository;

  Future<Result<PrintJobDTO>> sendPrintJob(
    SendPrintJobRequestDTO request,
  ) async {
    final params = SendPrintJobParams(
      printerId: request.printerId,
      documentName: request.documentName,
      payload: request.payload,
      totalPages: request.totalPages,
      datatype: request.datatype,
      userId: request.userId,
      username: request.username,
      documentType: request.documentType,
      department: request.department,
    );

    final result = await _sendPrintJob.call(params);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<List<PrintJobDTO>>> getJobHistory({int limit = 50}) async {
    final result = await _getJobHistory.call(limit: limit);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrintJobDTO>>> getPendingJobs() async {
    final result = await _getJobHistory.getPending();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrintJobDTO>>> getInProgressJobs() async {
    final result = await _getJobHistory.getInProgress();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrintJobDTO>>> getFailedJobs() async {
    final result = await _getJobHistory.getFailed();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<PrintJobDTO>> getJobById(String jobId) async {
    final result = await _jobRepository.getById(JobId(value: jobId));

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrintJobMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<void>> cleanOldJobs({int daysToKeep = 30}) async {
    return await _getJobHistory.cleanOldJobs(daysToKeep: daysToKeep);
  }
}

