import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../dtos/metrics_dto.dart';
import 'dashboard_cache_service.dart';

class DashboardMetricsService {
  final IPrinterRepository _printerRepository;
  final IJobRepository _jobRepository;
  final IHostRepository _hostRepository;
  final IAppLogRepository _logRepository;
  final DashboardCacheService _cacheService;

  DashboardMetricsService({
    required IPrinterRepository printerRepository,
    required IJobRepository jobRepository,
    required IHostRepository hostRepository,
    required IAppLogRepository logRepository,
    DashboardCacheService? cacheService,
  }) : _printerRepository = printerRepository,
       _jobRepository = jobRepository,
       _hostRepository = hostRepository,
       _logRepository = logRepository,
       _cacheService = cacheService ?? DashboardCacheService();

  Future<Result<DashboardMetrics>> getMetrics({String? printerId}) async {
    final cached = _cacheService.getCachedMetrics(printerId: printerId);
    if (cached != null) {
      return Success(cached);
    }

    try {
      final printersResult = await _printerRepository.getAll();
      if (printersResult.isError()) {
        return Failure(printersResult.exceptionOrNull()!);
      }

      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) {
        return Failure(jobsResult.exceptionOrNull()!);
      }

      final hostsResult = await _hostRepository.getAll();
      if (hostsResult.isError()) {
        return Failure(hostsResult.exceptionOrNull()!);
      }

      final alertsResult = await getActiveAlerts();
      if (alertsResult.isError()) {
        return Failure(alertsResult.exceptionOrNull()!);
      }

      var printers = printersResult.getOrThrow();
      var jobs = jobsResult.getOrThrow();
      final hosts = hostsResult.getOrThrow();
      final alerts = alertsResult.getOrThrow();

      if (printerId != null) {
        final filteredPrinters = printers
            .where((p) => p.id == printerId)
            .toList();

        if (filteredPrinters.isNotEmpty) {
          final selectedPrinter = filteredPrinters.first;
          printers = filteredPrinters;
          jobs = jobs
              .where((j) => j.printerName == selectedPrinter.name)
              .toList();
        } else {
          printers = [];
          jobs = [];
        }
      }

      final printerMetrics = _calculatePrinterMetrics(printers);
      final queueMetrics = _calculateQueueMetrics(jobs);
      final hostMetrics = _calculateHostMetrics(hosts);

      final metrics = DashboardMetrics(
        printers: printerMetrics,
        queue: queueMetrics,
        hosts: hostMetrics,
        activeAlerts: alerts,
        lastUpdated: DateTime.now(),
      );

      _cacheService.cacheMetrics(metrics, printerId: printerId);

      return Success(metrics);
    } catch (e) {
      return Failure(
        StorageException(
          'E_METRICS_FAILED',
          'Failed to get metrics: ${e.toString()}',
        ),
      );
    }
  }

  Future<Result<List<UsageTrend>>> getUsageTrends({
    required DateTime startDate,
    required DateTime endDate,
    String? printerId,
    TimePeriod? period,
  }) async {
    final cached = _cacheService.getCachedTrends(
      printerId: printerId,
      period: period,
    );
    if (cached != null) {
      return Success(cached);
    }

    try {
      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) {
        return Failure(jobsResult.exceptionOrNull()!);
      }

      final jobs = jobsResult.getOrThrow();

      final trends = _calculateUsageTrends(jobs, startDate, endDate);
      _cacheService.cacheTrends(trends, printerId: printerId, period: period);
      return Success(trends);
    } catch (e) {
      return Failure(
        StorageException(
          'E_TRENDS_FAILED',
          'Failed to get usage trends: ${e.toString()}',
        ),
      );
    }
  }

  Future<Result<PerformanceMetrics>> getPerformanceMetrics() async {
    try {
      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) {
        return Failure(jobsResult.exceptionOrNull()!);
      }

      final jobs = jobsResult.getOrThrow();
      final completedJobs = jobs
          .where(
            (j) =>
                j.status == PrintJobStatus.printed ||
                j.status == PrintJobStatus.sent,
          )
          .toList();

      if (completedJobs.isEmpty) {
        return Success(
          const PerformanceMetrics(
            avgCompletionTime: 0.0,
            successRate: 100.0,
            totalDataPrinted: 0,
          ),
        );
      }

      final totalDuration = completedJobs.fold<Duration>(
        Duration.zero,
        (sum, job) => sum + (job.duration ?? Duration.zero),
      );

      final avgDuration =
          totalDuration.inMilliseconds / completedJobs.length / 1000.0;

      final totalData = completedJobs.fold<int>(
        0,
        (sum, job) => sum + job.totalSize,
      );

      final successJobs = completedJobs
          .where((j) => !j.isFailed && !j.isCancelled)
          .length;

      final successRate = (successJobs / completedJobs.length) * 100;

      return Success(
        PerformanceMetrics(
          avgCompletionTime: avgDuration,
          successRate: successRate,
          totalDataPrinted: totalData,
        ),
      );
    } catch (e) {
      return Failure(
        StorageException(
          'E_PERFORMANCE_FAILED',
          'Failed to get performance metrics: ${e.toString()}',
        ),
      );
    }
  }

  Future<Result<List<AppLog>>> getActiveAlerts() async {
    try {
      final result = await _logRepository.getAll(
        filters: AppLogFilters(levels: [AppLogLevel.error, AppLogLevel.fatal]),
        limit: 10,
      );

      if (result.isError()) {
        return Failure(result.exceptionOrNull()!);
      }

      final logs = result.getOrThrow();

      final sortedLogs = logs.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return Success(sortedLogs);
    } catch (e) {
      return Failure(
        StorageException(
          'E_ALERTS_FAILED',
          'Failed to get active alerts: ${e.toString()}',
        ),
      );
    }
  }

  PrinterMetrics _calculatePrinterMetrics(List<Printer> printers) {
    final total = printers.length;
    final online = printers.where((p) => p.isOnline).length;
    final offline = printers
        .where((p) => p.status == PrinterStatus.offline)
        .length;
    final error = printers.where((p) => p.status == PrinterStatus.error).length;
    final paused = printers
        .where((p) => p.status == PrinterStatus.paused)
        .length;
    final printing = printers
        .where((p) => p.status == PrinterStatus.printing)
        .length;

    return PrinterMetrics(
      total: total,
      online: online,
      offline: offline,
      error: error,
      paused: paused,
      printing: printing,
    );
  }

  QueueMetrics _calculateQueueMetrics(List<PrintJob> jobs) {
    final now = DateTime.now();
    final pending = jobs
        .where((j) => j.status == PrintJobStatus.pending)
        .length;
    final printing = jobs
        .where(
          (j) =>
              j.status == PrintJobStatus.printing ||
              j.status == PrintJobStatus.sending,
        )
        .length;
    final failed = jobs.where((j) => j.status == PrintJobStatus.failed).length;

    final completed24h = jobs
        .where(
          (j) =>
              j.isComplete &&
              j.completedAt != null &&
              now.difference(j.completedAt!).inHours <= 24,
        )
        .length;

    final completed7d = jobs
        .where(
          (j) =>
              j.isComplete &&
              j.completedAt != null &&
              now.difference(j.completedAt!).inDays <= 7,
        )
        .length;

    final completed30d = jobs
        .where(
          (j) =>
              j.isComplete &&
              j.completedAt != null &&
              now.difference(j.completedAt!).inDays <= 30,
        )
        .length;

    return QueueMetrics(
      pending: pending,
      printing: printing,
      failed: failed,
      completed24h: completed24h,
      completed7d: completed7d,
      completed30d: completed30d,
    );
  }

  HostMetrics _calculateHostMetrics(List<Host> hosts) {
    final total = hosts.length;
    final online = hosts.where((h) => h.isOnline).length;
    final offline = hosts.where((h) => h.status == HostStatus.offline).length;

    final hostInfoList = hosts
        .map(
          (h) => HostStatusInfo(
            id: h.id,
            name: h.name,
            status: h.status,
            lastSeen: h.lastSeen,
          ),
        )
        .toList();

    return HostMetrics(
      total: total,
      online: online,
      offline: offline,
      hosts: hostInfoList,
    );
  }

  List<UsageTrend> _calculateUsageTrends(
    List<PrintJob> jobs,
    DateTime startDate,
    DateTime endDate,
  ) {
    final trends = <UsageTrend>[];
    final dayDuration = const Duration(days: 1);

    for (
      var date = startDate;
      date.isBefore(endDate);
      date = date.add(dayDuration)
    ) {
      final nextDay = date.add(dayDuration);

      final dayJobs = jobs
          .where(
            (j) => j.createdAt.isAfter(date) && j.createdAt.isBefore(nextDay),
          )
          .toList();

      final totalJobs = dayJobs.length;
      final successJobs = dayJobs
          .where(
            (j) =>
                j.status == PrintJobStatus.printed ||
                j.status == PrintJobStatus.sent,
          )
          .length;
      final failedJobs = dayJobs
          .where((j) => j.status == PrintJobStatus.failed)
          .length;

      trends.add(
        UsageTrend(
          date: date,
          totalJobs: totalJobs,
          successJobs: successJobs,
          failedJobs: failedJobs,
        ),
      );
    }

    return trends;
  }
}
