import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class PrinterSupplyMapper {
  static PrinterSupply toEntity(PrinterSupplyData data) {
    return PrinterSupply(
      id: data.id,
      printerId: data.printerId,
      type: _parseSupplyType(data.supplyType),
      level: data.level,
      unit: data.unit,
      lastChecked: data.lastChecked,
    );
  }

  static PrinterSuppliesCompanion toCompanion(PrinterSupply entity) {
    return PrinterSuppliesCompanion.insert(
      id: entity.id,
      printerId: entity.printerId,
      supplyType: _supplyTypeToString(entity.type),
      level: entity.level,
      unit: entity.unit,
      lastChecked: entity.lastChecked,
    );
  }

  static PrinterSuppliesCompanion toUpdateCompanion(PrinterSupply entity) {
    return PrinterSuppliesCompanion(
      id: Value(entity.id),
      printerId: Value(entity.printerId),
      supplyType: Value(_supplyTypeToString(entity.type)),
      level: Value(entity.level),
      unit: Value(entity.unit),
      lastChecked: Value(entity.lastChecked),
    );
  }

  static SupplyType _parseSupplyType(String type) {
    switch (type.toLowerCase()) {
      case 'toner':
        return SupplyType.toner;
      case 'ink':
        return SupplyType.ink;
      case 'paper':
        return SupplyType.paper;
      case 'drum':
        return SupplyType.drum;
      case 'fuser':
        return SupplyType.fuser;
      default:
        return SupplyType.other;
    }
  }

  static String _supplyTypeToString(SupplyType type) {
    switch (type) {
      case SupplyType.toner:
        return 'toner';
      case SupplyType.ink:
        return 'ink';
      case SupplyType.paper:
        return 'paper';
      case SupplyType.drum:
        return 'drum';
      case SupplyType.fuser:
        return 'fuser';
      case SupplyType.other:
        return 'other';
    }
  }
}
