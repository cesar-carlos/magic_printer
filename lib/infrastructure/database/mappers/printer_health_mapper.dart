import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class PrinterHealthMapper {
  static PrinterHealth toEntity(PrinterHealthData data) {
    return PrinterHealth(
      printerId: data.printerId,
      healthScore: data.healthScore,
      errorRate: data.errorRate,
      availability: data.availability,
      avgResponseTime: Duration(milliseconds: data.avgResponseTimeMs),
      supplyScore: data.supplyScore,
      lastCheck: data.lastCheck,
      trends: [],
      indicators: {},
    );
  }

  static PrinterHealthTableCompanion toCompanion(PrinterHealth entity) {
    return PrinterHealthTableCompanion.insert(
      printerId: entity.printerId,
      healthScore: entity.healthScore,
      errorRate: entity.errorRate,
      availability: entity.availability,
      avgResponseTimeMs: entity.avgResponseTime.inMilliseconds,
      supplyScore: entity.supplyScore,
      lastCheck: entity.lastCheck,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static PrinterHealthTableCompanion toUpdateCompanion(PrinterHealth entity) {
    return PrinterHealthTableCompanion(
      printerId: Value(entity.printerId),
      healthScore: Value(entity.healthScore),
      errorRate: Value(entity.errorRate),
      availability: Value(entity.availability),
      avgResponseTimeMs: Value(entity.avgResponseTime.inMilliseconds),
      supplyScore: Value(entity.supplyScore),
      lastCheck: Value(entity.lastCheck),
      updatedAt: Value(DateTime.now()),
    );
  }
}
