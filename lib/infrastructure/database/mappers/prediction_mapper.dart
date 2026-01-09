import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class PredictionMapper {
  static Prediction toEntity(PredictionData data) {
    return Prediction(
      id: data.id,
      printerId: data.printerId,
      type: PredictionType.values[data.type],
      predictedDate: data.predictedDate,
      confidence: data.confidence,
      factors: _parseJson(data.factors),
      createdAt: data.createdAt,
      status: PredictionStatus.values[data.status],
    );
  }

  static PredictionsTableCompanion toCompanion(Prediction entity) {
    return PredictionsTableCompanion.insert(
      id: entity.id,
      printerId: entity.printerId,
      type: entity.type.index,
      predictedDate: entity.predictedDate,
      confidence: entity.confidence,
      factors: _toJson(entity.factors),
      createdAt: entity.createdAt,
      status: Value(entity.status.index),
    );
  }

  static Map<String, dynamic> _parseJson(String jsonString) {
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  static String _toJson(Map<String, dynamic> map) {
    try {
      return jsonEncode(map);
    } catch (e) {
      return '{}';
    }
  }
}
