enum PredictionType {
  tonerDepletion,
  paperDepletion,
  maintenanceNeeded,
  failureLikelihood,
  queueOverload,
}

enum PredictionStatus {
  pending,
  occurred,
  avoided,
  expired,
}

class Prediction {
  final String id;
  final String printerId;
  final PredictionType type;
  final DateTime predictedDate;
  final double confidence;
  final Map<String, dynamic> factors;
  final DateTime createdAt;
  final PredictionStatus status;

  Prediction({
    required this.id,
    required this.printerId,
    required this.type,
    required this.predictedDate,
    required this.confidence,
    required this.factors,
    required this.createdAt,
    this.status = PredictionStatus.pending,
  });

  bool get isExpired => DateTime.now().isAfter(predictedDate.add(const Duration(days: 1)));

  Prediction copyWith({
    String? id,
    String? printerId,
    PredictionType? type,
    DateTime? predictedDate,
    double? confidence,
    Map<String, dynamic>? factors,
    DateTime? createdAt,
    PredictionStatus? status,
  }) {
    return Prediction(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      predictedDate: predictedDate ?? this.predictedDate,
      confidence: confidence ?? this.confidence,
      factors: factors ?? this.factors,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Prediction && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Prediction($id, $type, predictedDate: $predictedDate, confidence: $confidence)';
}
