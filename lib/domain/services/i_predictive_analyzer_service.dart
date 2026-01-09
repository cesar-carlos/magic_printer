import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../entities/pattern.dart';
import '../entities/prediction.dart';

abstract class IPredictiveAnalyzerService {
  Future<Result<List<Prediction>>> analyze(String printerId);

  Future<Result<List<Pattern>>> detectPatterns(String printerId);

  Stream<Prediction> watchPredictions(String printerId);

  bool get isEnabled;

  void setEnabled(bool enabled);
}
