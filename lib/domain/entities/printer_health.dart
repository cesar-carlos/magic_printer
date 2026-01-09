class HealthTrend {
  final DateTime timestamp;
  final int score;

  HealthTrend({
    required this.timestamp,
    required this.score,
  });

  HealthTrend copyWith({
    DateTime? timestamp,
    int? score,
  }) {
    return HealthTrend(
      timestamp: timestamp ?? this.timestamp,
      score: score ?? this.score,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthTrend &&
          timestamp == other.timestamp &&
          score == other.score;

  @override
  int get hashCode => timestamp.hashCode ^ score.hashCode;

  @override
  String toString() => 'HealthTrend($score at $timestamp)';
}

class PrinterHealth {
  final String printerId;
  final int healthScore;
  final double errorRate;
  final double availability;
  final Duration avgResponseTime;
  final int supplyScore;
  final DateTime lastCheck;
  final List<HealthTrend> trends;
  final Map<String, dynamic> indicators;

  PrinterHealth({
    required this.printerId,
    required this.healthScore,
    required this.errorRate,
    required this.availability,
    required this.avgResponseTime,
    required this.supplyScore,
    required this.lastCheck,
    required this.trends,
    required this.indicators,
  });

  bool get isHealthy => healthScore >= 70;
  bool get isWarning => healthScore >= 50 && healthScore < 70;
  bool get isCritical => healthScore < 50;

  PrinterHealth copyWith({
    String? printerId,
    int? healthScore,
    double? errorRate,
    double? availability,
    Duration? avgResponseTime,
    int? supplyScore,
    DateTime? lastCheck,
    List<HealthTrend>? trends,
    Map<String, dynamic>? indicators,
  }) {
    return PrinterHealth(
      printerId: printerId ?? this.printerId,
      healthScore: healthScore ?? this.healthScore,
      errorRate: errorRate ?? this.errorRate,
      availability: availability ?? this.availability,
      avgResponseTime: avgResponseTime ?? this.avgResponseTime,
      supplyScore: supplyScore ?? this.supplyScore,
      lastCheck: lastCheck ?? this.lastCheck,
      trends: trends ?? this.trends,
      indicators: indicators ?? this.indicators,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterHealth && printerId == other.printerId;

  @override
  int get hashCode => printerId.hashCode;

  @override
  String toString() =>
      'PrinterHealth($printerId, score: $healthScore, errorRate: $errorRate, availability: $availability)';
}
