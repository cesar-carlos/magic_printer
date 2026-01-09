import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class PrinterMaintenanceMapper {
  static PrinterMaintenance toEntity(PrinterMaintenanceData data) {
    return PrinterMaintenance(
      id: data.id,
      printerId: data.printerId,
      type: _parseMaintenanceType(data.maintenanceType),
      description: data.description,
      performedBy: data.performedBy,
      performedAt: data.performedAt,
      notes: data.notes,
    );
  }

  static PrinterMaintenancesCompanion toCompanion(
    PrinterMaintenance entity,
  ) {
    return PrinterMaintenancesCompanion.insert(
      id: entity.id,
      printerId: entity.printerId,
      maintenanceType: _maintenanceTypeToString(entity.type),
      description: Value(entity.description),
      performedBy: Value(entity.performedBy),
      performedAt: entity.performedAt,
      notes: Value(entity.notes),
    );
  }

  static PrinterMaintenancesCompanion toUpdateCompanion(
    PrinterMaintenance entity,
  ) {
    return PrinterMaintenancesCompanion(
      id: Value(entity.id),
      printerId: Value(entity.printerId),
      maintenanceType: Value(_maintenanceTypeToString(entity.type)),
      description: Value(entity.description),
      performedBy: Value(entity.performedBy),
      performedAt: Value(entity.performedAt),
      notes: Value(entity.notes),
    );
  }

  static MaintenanceType _parseMaintenanceType(String type) {
    switch (type.toLowerCase()) {
      case 'cleaning':
        return MaintenanceType.cleaning;
      case 'tonerchange':
      case 'toner_change':
        return MaintenanceType.tonerChange;
      case 'inkchange':
      case 'ink_change':
        return MaintenanceType.inkChange;
      case 'paperrefill':
      case 'paper_refill':
        return MaintenanceType.paperRefill;
      case 'repair':
        return MaintenanceType.repair;
      case 'replacement':
        return MaintenanceType.replacement;
      default:
        return MaintenanceType.other;
    }
  }

  static String _maintenanceTypeToString(MaintenanceType type) {
    switch (type) {
      case MaintenanceType.cleaning:
        return 'cleaning';
      case MaintenanceType.tonerChange:
        return 'toner_change';
      case MaintenanceType.inkChange:
        return 'ink_change';
      case MaintenanceType.paperRefill:
        return 'paper_refill';
      case MaintenanceType.repair:
        return 'repair';
      case MaintenanceType.replacement:
        return 'replacement';
      case MaintenanceType.other:
        return 'other';
    }
  }
}
