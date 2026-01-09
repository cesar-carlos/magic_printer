import 'package:result_dart/result_dart.dart';

import '../entities/pattern.dart';
import '../entities/prediction.dart';

abstract class IPredictionRepository {
  Future<Result<List<Prediction>>> getPredictions(String printerId);

  Future<Result<void>> addPrediction(Prediction prediction);

  Future<Result<void>> updatePredictionStatus(String id, PredictionStatus status);

  Future<Result<List<Pattern>>> detectPatterns(String printerId);
}
