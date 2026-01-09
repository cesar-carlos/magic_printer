import '../dtos/metrics_dto.dart';

enum TimePeriod {
  last24h,
  last7d,
  last30d,
  all,
}

class DashboardCacheService {
  DashboardMetrics? _cachedMetrics;
  List<UsageTrend>? _cachedTrends;
  DateTime? _lastCacheUpdate;
  String? _cachedPrinterId;
  TimePeriod? _cachedPeriod;

  static const Duration cacheValidity = Duration(seconds: 10);

  bool isCacheValid({
    String? printerId,
    TimePeriod? period,
  }) {
    if (_lastCacheUpdate == null) return false;
    if (DateTime.now().difference(_lastCacheUpdate!) > cacheValidity) {
      return false;
    }
    if (_cachedPrinterId != printerId) return false;
    if (_cachedPeriod != period) return false;
    return true;
  }

  DashboardMetrics? getCachedMetrics({
    String? printerId,
    TimePeriod? period,
  }) {
    if (!isCacheValid(printerId: printerId, period: period)) {
      return null;
    }
    return _cachedMetrics;
  }

  List<UsageTrend>? getCachedTrends({
    String? printerId,
    TimePeriod? period,
  }) {
    if (!isCacheValid(printerId: printerId, period: period)) {
      return null;
    }
    return _cachedTrends;
  }

  void cacheMetrics(
    DashboardMetrics metrics, {
    String? printerId,
    TimePeriod? period,
  }) {
    _cachedMetrics = metrics;
    _cachedPrinterId = printerId;
    _cachedPeriod = period;
    _lastCacheUpdate = DateTime.now();
  }

  void cacheTrends(
    List<UsageTrend> trends, {
    String? printerId,
    TimePeriod? period,
  }) {
    _cachedTrends = trends;
    _cachedPrinterId = printerId;
    _cachedPeriod = period;
    _lastCacheUpdate = DateTime.now();
  }

  void clearCache() {
    _cachedMetrics = null;
    _cachedTrends = null;
    _lastCacheUpdate = null;
    _cachedPrinterId = null;
    _cachedPeriod = null;
  }
}
