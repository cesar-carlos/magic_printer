enum PatternType {
  errorRecurring,
  usageAnomaly,
  performanceDegradation,
}

class Pattern {
  final String id;
  final String printerId;
  final PatternType patternType;
  final String description;
  final int occurrenceCount;
  final DateTime lastOccurrence;
  final double confidence;

  Pattern({
    required this.id,
    required this.printerId,
    required this.patternType,
    required this.description,
    required this.occurrenceCount,
    required this.lastOccurrence,
    required this.confidence,
  });

  Pattern copyWith({
    String? id,
    String? printerId,
    PatternType? patternType,
    String? description,
    int? occurrenceCount,
    DateTime? lastOccurrence,
    double? confidence,
  }) {
    return Pattern(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      patternType: patternType ?? this.patternType,
      description: description ?? this.description,
      occurrenceCount: occurrenceCount ?? this.occurrenceCount,
      lastOccurrence: lastOccurrence ?? this.lastOccurrence,
      confidence: confidence ?? this.confidence,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Pattern && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Pattern($id, $patternType, occurrences: $occurrenceCount, confidence: $confidence)';
}
