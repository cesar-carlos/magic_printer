import '../../domain/domain.dart';

class DashboardMetrics {
  final PrinterMetrics printers;
  final QueueMetrics queue;
  final HostMetrics hosts;
  final List<AppLog> activeAlerts;
  final DateTime lastUpdated;

  const DashboardMetrics({
    required this.printers,
    required this.queue,
    required this.hosts,
    required this.activeAlerts,
    required this.lastUpdated,
  });

  DashboardMetrics copyWith({
    PrinterMetrics? printers,
    QueueMetrics? queue,
    HostMetrics? hosts,
    List<AppLog>? activeAlerts,
    DateTime? lastUpdated,
  }) {
    return DashboardMetrics(
      printers: printers ?? this.printers,
      queue: queue ?? this.queue,
      hosts: hosts ?? this.hosts,
      activeAlerts: activeAlerts ?? this.activeAlerts,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class PrinterMetrics {
  final int total;
  final int online;
  final int offline;
  final int error;
  final int paused;
  final int printing;

  const PrinterMetrics({
    required this.total,
    required this.online,
    required this.offline,
    required this.error,
    required this.paused,
    required this.printing,
  });

  double get onlinePercentage =>
      total > 0 ? (online / total) * 100 : 0.0;

  double get errorPercentage =>
      total > 0 ? (error / total) * 100 : 0.0;

  PrinterMetrics copyWith({
    int? total,
    int? online,
    int? offline,
    int? error,
    int? paused,
    int? printing,
  }) {
    return PrinterMetrics(
      total: total ?? this.total,
      online: online ?? this.online,
      offline: offline ?? this.offline,
      error: error ?? this.error,
      paused: paused ?? this.paused,
      printing: printing ?? this.printing,
    );
  }
}

class QueueMetrics {
  final int pending;
  final int printing;
  final int failed;
  final int completed24h;
  final int completed7d;
  final int completed30d;

  const QueueMetrics({
    required this.pending,
    required this.printing,
    required this.failed,
    required this.completed24h,
    required this.completed7d,
    required this.completed30d,
  });

  int get total => pending + printing + failed;

  double get successRate {
    if (completed24h == 0) return 100.0;
    final successCount = completed24h - failed;
    return (successCount / completed24h) * 100;
  }

  QueueMetrics copyWith({
    int? pending,
    int? printing,
    int? failed,
    int? completed24h,
    int? completed7d,
    int? completed30d,
  }) {
    return QueueMetrics(
      pending: pending ?? this.pending,
      printing: printing ?? this.printing,
      failed: failed ?? this.failed,
      completed24h: completed24h ?? this.completed24h,
      completed7d: completed7d ?? this.completed7d,
      completed30d: completed30d ?? this.completed30d,
    );
  }
}

class HostMetrics {
  final int total;
  final int online;
  final int offline;
  final List<HostStatusInfo> hosts;

  const HostMetrics({
    required this.total,
    required this.online,
    required this.offline,
    required this.hosts,
  });

  double get onlinePercentage =>
      total > 0 ? (online / total) * 100 : 0.0;

  HostMetrics copyWith({
    int? total,
    int? online,
    int? offline,
    List<HostStatusInfo>? hosts,
  }) {
    return HostMetrics(
      total: total ?? this.total,
      online: online ?? this.online,
      offline: offline ?? this.offline,
      hosts: hosts ?? this.hosts,
    );
  }
}

class HostStatusInfo {
  final String id;
  final String name;
  final HostStatus status;
  final DateTime? lastSeen;

  const HostStatusInfo({
    required this.id,
    required this.name,
    required this.status,
    this.lastSeen,
  });
}

class UsageTrend {
  final DateTime date;
  final int totalJobs;
  final int successJobs;
  final int failedJobs;

  const UsageTrend({
    required this.date,
    required this.totalJobs,
    required this.successJobs,
    required this.failedJobs,
  });

  double get successRate =>
      totalJobs > 0 ? (successJobs / totalJobs) * 100 : 100.0;
}

class PerformanceMetrics {
  final double avgCompletionTime;
  final double successRate;
  final int totalDataPrinted;

  const PerformanceMetrics({
    required this.avgCompletionTime,
    required this.successRate,
    required this.totalDataPrinted,
  });

  String getFormattedAvgCompletionTime() {
    final seconds = avgCompletionTime;
    if (seconds < 60) {
      return '${seconds.toStringAsFixed(1)}s';
    } else if (seconds < 3600) {
      final minutes = seconds / 60;
      return '${minutes.toStringAsFixed(1)}m';
    } else {
      final hours = seconds / 3600;
      return '${hours.toStringAsFixed(1)}h';
    }
  }

  String getFormattedTotalData() {
    if (totalDataPrinted < 1024) {
      return '${totalDataPrinted}B';
    } else if (totalDataPrinted < 1024 * 1024) {
      final kb = totalDataPrinted / 1024;
      return '${kb.toStringAsFixed(1)}KB';
    } else if (totalDataPrinted < 1024 * 1024 * 1024) {
      final mb = totalDataPrinted / (1024 * 1024);
      return '${mb.toStringAsFixed(1)}MB';
    } else {
      final gb = totalDataPrinted / (1024 * 1024 * 1024);
      return '${gb.toStringAsFixed(1)}GB';
    }
  }
}
