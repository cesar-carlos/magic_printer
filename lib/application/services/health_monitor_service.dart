import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';

class HealthMonitorService implements IHealthMonitorService {
  final IPrinterRepository _printerRepository;
  final IPrinterHealthRepository _healthRepository;
  final IJobRepository _jobRepository;
  final IPrinterMaintenanceRepository _maintenanceRepository;
  final IPrinterSupplyRepository _supplyRepository;

  Timer? _monitoringTimer;
  bool _isEnabled = false;
  final _healthStreamControllers = <String, StreamController<PrinterHealth>>{};

  HealthMonitorService({
    required IPrinterRepository printerRepository,
    required IPrinterHealthRepository healthRepository,
    required IJobRepository jobRepository,
    required IPrinterMaintenanceRepository maintenanceRepository,
    required IPrinterSupplyRepository supplyRepository,
  })  : _printerRepository = printerRepository,
        _healthRepository = healthRepository,
        _jobRepository = jobRepository,
        _maintenanceRepository = maintenanceRepository,
        _supplyRepository = supplyRepository;

  @override
  bool get isEnabled => _isEnabled;

  @override
  void setEnabled(bool enabled) {
    if (_isEnabled == enabled) return;

    _isEnabled = enabled;

    if (enabled) {
      _startMonitoring();
    } else {
      _stopMonitoring();
    }
  }

  void _startMonitoring() {
    if (_monitoringTimer != null && _monitoringTimer!.isActive) {
      return;
    }

    _monitoringTimer = Timer.periodic(
      defaultHealthCheckInterval,
      (_) => _checkAllPrinters(),
    );

    _checkAllPrinters();
  }

  void _stopMonitoring() {
    _monitoringTimer?.cancel();
    _monitoringTimer = null;
  }

  Future<void> _checkAllPrinters() async {
    final printersResult = await _printerRepository.getAll();
    if (printersResult.isError()) return;

    final printers = printersResult.getOrThrow();
    for (final printer in printers) {
      await calculateHealth(printer.id);
    }
  }

  @override
  Future<Result<PrinterHealth>> calculateHealth(String printerId) async {
    try {
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) {
        return Failure(printerResult.exceptionOrNull()!);
      }

      final printer = printerResult.getOrThrow();

      final errorRate = await _calculateErrorRate(printerId);
      final availability = await _calculateAvailability(printerId);
      final avgResponseTime = await _calculateAvgResponseTime(printerId);
      final supplyScore = await _calculateSupplyScore(printerId);
      final maintenanceScore = await _calculateMaintenanceScore(printerId);

      final healthScore = _calculateHealthScore(
        errorRate: errorRate,
        availability: availability,
        responseTime: avgResponseTime,
        supplyScore: supplyScore,
        maintenanceScore: maintenanceScore,
      );

      final health = PrinterHealth(
        printerId: printerId,
        healthScore: healthScore,
        errorRate: errorRate,
        availability: availability,
        avgResponseTime: avgResponseTime,
        supplyScore: supplyScore,
        lastCheck: DateTime.now(),
        trends: [],
        indicators: {
          'maintenanceScore': maintenanceScore,
          'printerStatus': printer.status.toString(),
          'jobCount': printer.jobCount,
        },
      );

      await _healthRepository.updateHealth(health);

      final trendsResult = await _healthRepository.getTrends(
        printerId,
        period: const Duration(days: 30),
      );
      if (trendsResult.isSuccess()) {
        final trends = trendsResult.getOrThrow();
        final updatedHealth = health.copyWith(trends: trends);
        _notifyHealthUpdate(printerId, updatedHealth);
        return Success(updatedHealth);
      }

      _notifyHealthUpdate(printerId, health);
      return Success(health);
    } catch (e) {
      return Failure(
        StorageException(
          'E_HEALTH_CALCULATION_FAILED',
          'Failed to calculate health for printer $printerId: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Result<List<PrinterHealth>>> calculateAllHealth() async {
    try {
      final printersResult = await _printerRepository.getAll();
      if (printersResult.isError()) {
        return Failure(printersResult.exceptionOrNull()!);
      }

      final printers = printersResult.getOrThrow();
      final healthList = <PrinterHealth>[];

      for (final printer in printers) {
        final healthResult = await calculateHealth(printer.id);
        if (healthResult.isSuccess()) {
          healthList.add(healthResult.getOrThrow());
        }
      }

      return Success(healthList);
    } catch (e) {
      return Failure(
        StorageException(
          'E_HEALTH_CALCULATION_FAILED',
          'Failed to calculate all health: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Stream<PrinterHealth> watchHealth(String printerId) {
    if (!_healthStreamControllers.containsKey(printerId)) {
      _healthStreamControllers[printerId] = StreamController<PrinterHealth>.broadcast();
    }
    return _healthStreamControllers[printerId]!.stream;
  }

  void _notifyHealthUpdate(String printerId, PrinterHealth health) {
    final controller = _healthStreamControllers[printerId];
    if (controller != null && !controller.isClosed) {
      controller.add(health);
    }
  }

  Future<double> _calculateErrorRate(String printerId) async {
    try {
      final cutoffDate = DateTime.now().subtract(const Duration(days: 30));
      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) return 0.0;

      final allJobs = jobsResult.getOrThrow();
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) return 0.0;

      final printer = printerResult.getOrThrow();
      final printerJobs = allJobs
          .where((j) =>
              j.printerName == printer.name &&
              j.createdAt.isAfter(cutoffDate))
          .toList();

      if (printerJobs.isEmpty) return 0.0;

      final failedJobs = printerJobs.where((j) => j.isFailed).length;
      return failedJobs / printerJobs.length;
    } catch (e) {
      return 0.0;
    }
  }

  Future<double> _calculateAvailability(String printerId) async {
    try {
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) return 0.0;

      final printer = printerResult.getOrThrow();
      if (printer.lastSeen == null) return 0.0;

      final timeSinceLastSeen = DateTime.now().difference(printer.lastSeen!);
      if (timeSinceLastSeen > const Duration(hours: 24)) {
        return 0.0;
      }

      if (printer.status == PrinterStatus.offline ||
          printer.status == PrinterStatus.error) {
        return 0.3;
      }

      if (printer.status == PrinterStatus.online) {
        return 1.0;
      }

      return 0.5;
    } catch (e) {
      return 0.0;
    }
  }

  Future<Duration> _calculateAvgResponseTime(String printerId) async {
    try {
      final cutoffDate = DateTime.now().subtract(const Duration(days: 7));
      final jobsResult = await _jobRepository.getAll();
      if (jobsResult.isError()) {
        return const Duration(seconds: 0);
      }

      final allJobs = jobsResult.getOrThrow();
      final printerResult = await _printerRepository.getById(printerId);
      if (printerResult.isError()) {
        return const Duration(seconds: 0);
      }

      final printer = printerResult.getOrThrow();
      final printerJobs = allJobs
          .where((j) =>
              j.printerName == printer.name &&
              j.createdAt.isAfter(cutoffDate) &&
              j.completedAt != null &&
              j.startedAt != null)
          .toList();

      if (printerJobs.isEmpty) {
        return const Duration(seconds: 0);
      }

      final totalDuration = printerJobs.fold<Duration>(
        Duration.zero,
        (sum, job) {
          if (job.startedAt != null && job.completedAt != null) {
            return sum + job.completedAt!.difference(job.startedAt!);
          }
          return sum;
        },
      );

      return Duration(
        milliseconds: totalDuration.inMilliseconds ~/ printerJobs.length,
      );
    } catch (e) {
      return const Duration(seconds: 0);
    }
  }

  Future<int> _calculateSupplyScore(String printerId) async {
    try {
      final suppliesResult = await _supplyRepository.getByPrinterId(printerId);
      if (suppliesResult.isError()) return 50;

      final supplies = suppliesResult.getOrThrow();
      if (supplies.isEmpty) return 50;

      int totalScore = 0;
      int count = 0;

      for (final supply in supplies) {
        if (supply.isCritical) {
          totalScore += 0;
        } else if (supply.isLow) {
          totalScore += 30;
        } else if (supply.level > 50) {
          totalScore += 100;
        } else {
          totalScore += 50;
        }
        count++;
      }

      return count > 0 ? totalScore ~/ count : 50;
    } catch (e) {
      return 50;
    }
  }

  Future<int> _calculateMaintenanceScore(String printerId) async {
    try {
      final maintenancesResult =
          await _maintenanceRepository.getRecentMaintenance(
        printerId: printerId,
        limit: 10,
      );
      if (maintenancesResult.isError()) return 100;

      final maintenances = maintenancesResult.getOrThrow();
      if (maintenances.isEmpty) return 100;

      final lastMaintenance = maintenances.first;
      final daysSinceMaintenance =
          DateTime.now().difference(lastMaintenance.performedAt).inDays;

      if (daysSinceMaintenance < 30) {
        return 100;
      } else if (daysSinceMaintenance < 60) {
        return 80;
      } else if (daysSinceMaintenance < 90) {
        return 60;
      } else {
        return 40;
      }
    } catch (e) {
      return 50;
    }
  }

  int _calculateHealthScore({
    required double errorRate,
    required double availability,
    required Duration responseTime,
    required int supplyScore,
    required int maintenanceScore,
  }) {
    final errorScore = (1.0 - errorRate) * 100;
    final availabilityScore = availability * 100;
    final responseTimeScore = _calculateResponseTimeScore(responseTime);

    final weightedScore = (errorScore * 0.3) +
        (availabilityScore * 0.3) +
        (supplyScore * 0.2) +
        (maintenanceScore * 0.1) +
        (responseTimeScore * 0.1);

    return weightedScore.round().clamp(0, 100);
  }

  int _calculateResponseTimeScore(Duration responseTime) {
    if (responseTime.inSeconds == 0) return 50;

    if (responseTime.inSeconds < 5) {
      return 100;
    } else if (responseTime.inSeconds < 10) {
      return 80;
    } else if (responseTime.inSeconds < 30) {
      return 60;
    } else if (responseTime.inSeconds < 60) {
      return 40;
    } else {
      return 20;
    }
  }

  void dispose() {
    _stopMonitoring();
    for (final controller in _healthStreamControllers.values) {
      controller.close();
    }
    _healthStreamControllers.clear();
  }
}
