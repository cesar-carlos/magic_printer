import 'dart:convert';

import 'package:dio/dio.dart';

import '../../domain/domain.dart';

class WebhookService {
  final Dio _dio;

  WebhookService({Dio? dio}) : _dio = dio ?? Dio();

  Future<bool> sendAlert({
    required String url,
    required Alert alert,
    Map<String, String>? headers,
    int maxRetries = 3,
  }) async {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        final payload = {
          'id': alert.id,
          'ruleId': alert.ruleId,
          'printerId': alert.printerId,
          'severity': alert.severity.toString(),
          'title': alert.title,
          'message': alert.message,
          'details': alert.details,
          'createdAt': alert.createdAt.toIso8601String(),
          'acknowledged': alert.acknowledged,
        };

        final response = await _dio.post(
          url,
          data: jsonEncode(payload),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
            validateStatus: (status) => status != null && status < 500,
          ),
        );

        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return true;
        }
      } catch (e) {
        if (attempt == maxRetries - 1) {
          return false;
        }
        await Future.delayed(Duration(seconds: (attempt + 1) * 2));
      }
    }

    return false;
  }

  Future<bool> sendHealthUpdate({
    required String url,
    required PrinterHealth health,
    Map<String, String>? headers,
    int maxRetries = 3,
  }) async {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        final payload = {
          'printerId': health.printerId,
          'healthScore': health.healthScore,
          'errorRate': health.errorRate,
          'availability': health.availability,
          'supplyScore': health.supplyScore,
          'lastCheck': health.lastCheck.toIso8601String(),
          'indicators': health.indicators,
        };

        final response = await _dio.post(
          url,
          data: jsonEncode(payload),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
            validateStatus: (status) => status != null && status < 500,
          ),
        );

        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return true;
        }
      } catch (e) {
        if (attempt == maxRetries - 1) {
          return false;
        }
        await Future.delayed(Duration(seconds: (attempt + 1) * 2));
      }
    }

    return false;
  }

  Future<bool> sendPrediction({
    required String url,
    required Prediction prediction,
    Map<String, String>? headers,
    int maxRetries = 3,
  }) async {
    for (int attempt = 0; attempt < maxRetries; attempt++) {
      try {
        final payload = {
          'id': prediction.id,
          'printerId': prediction.printerId,
          'type': prediction.type.toString(),
          'predictedDate': prediction.predictedDate.toIso8601String(),
          'confidence': prediction.confidence,
          'factors': prediction.factors,
          'createdAt': prediction.createdAt.toIso8601String(),
          'status': prediction.status.toString(),
        };

        final response = await _dio.post(
          url,
          data: jsonEncode(payload),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              ...?headers,
            },
            validateStatus: (status) => status != null && status < 500,
          ),
        );

        if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
          return true;
        }
      } catch (e) {
        if (attempt == maxRetries - 1) {
          return false;
        }
        await Future.delayed(Duration(seconds: (attempt + 1) * 2));
      }
    }

    return false;
  }
}
