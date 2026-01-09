import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardMetricsService _metricsService;

  DashboardMetrics? _metrics;
  List<UsageTrend>? _usageTrends;
  bool _isLoading = false;
  String? _error;
  Timer? _refreshTimer;
  String? _selectedPrinterId;
  TimePeriod _selectedPeriod = TimePeriod.all;

  DashboardMetrics? get metrics => _metrics;
  List<UsageTrend>? get usageTrends => _usageTrends;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedPrinterId => _selectedPrinterId;
  TimePeriod get selectedPeriod => _selectedPeriod;

  DashboardProvider({required DashboardMetricsService metricsService})
    : _metricsService = metricsService {
    loadMetrics();
    _loadTrendsForPeriod();
    _startAutoRefresh();
  }

  void setPrinterFilter(String? printerId) {
    if (_selectedPrinterId != printerId) {
      _selectedPrinterId = printerId;
      loadMetrics();
    }
  }

  void clearPrinterFilter() {
    if (_selectedPrinterId != null) {
      _selectedPrinterId = null;
      loadMetrics();
    }
  }

  void setTimePeriod(TimePeriod period) {
    if (_selectedPeriod != period) {
      _selectedPeriod = period;
      loadMetrics();
      _loadTrendsForPeriod();
    }
  }

  void _loadTrendsForPeriod() {
    final now = DateTime.now();
    DateTime startDate;

    switch (_selectedPeriod) {
      case TimePeriod.last24h:
        startDate = now.subtract(const Duration(days: 1));
        break;
      case TimePeriod.last7d:
        startDate = now.subtract(const Duration(days: 7));
        break;
      case TimePeriod.last30d:
        startDate = now.subtract(const Duration(days: 30));
        break;
      case TimePeriod.all:
        startDate = now.subtract(const Duration(days: 90));
        break;
    }

    loadUsageTrends(startDate: startDate, endDate: now);
  }

  Future<void> loadMetrics() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _metricsService.getMetrics(
      printerId: _selectedPrinterId,
    );

    result.fold(
      (metrics) {
        _metrics = metrics;
        _isLoading = false;
        _error = null;
      },
      (exception) {
        _error = exception is AppException
            ? exception.message
            : exception.toString();
        _isLoading = false;
      },
    );

    notifyListeners();
  }

  Future<void> loadUsageTrends({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final result = await _metricsService.getUsageTrends(
      startDate: startDate,
      endDate: endDate,
    );

    result.fold(
      (trends) {
        _usageTrends = trends;
        notifyListeners();
      },
      (exception) {
        _error = exception is AppException
            ? exception.message
            : exception.toString();
        notifyListeners();
      },
    );
  }

  Future<void> loadPerformanceMetrics() async {
    final result = await _metricsService.getPerformanceMetrics();

    result.fold(
      (perfMetrics) {
        _metrics = _metrics?.copyWith() ?? _metrics;
        notifyListeners();
      },
      (exception) {
        _error = exception is AppException
            ? exception.message
            : exception.toString();
        notifyListeners();
      },
    );
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      loadMetrics();
    });
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}
