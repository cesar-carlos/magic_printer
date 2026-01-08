import 'package:drift/drift.dart';

import '../../../domain/domain.dart';
import '../app_database.dart';

class PrinterMapper {
  static Printer toEntity(PrinterData data) {
    return Printer(
      id: data.id,
      name: data.name,
      hostId: data.hostId,
      location: PrinterLocation.values[data.location],
      status: PrinterStatus.values[data.status],
      driverName: data.driverName,
      portName: data.portName,
      locationDescription: data.locationDescription,
      comment: data.comment,
      jobCount: data.jobCount,
      shared: data.shared,
      allowedGroups:
          data.allowedGroups.isEmpty ? [] : data.allowedGroups.split(','),
      lastSeen: data.lastSeen,
    );
  }

  static PrintersCompanion toCompanion(Printer entity) {
    return PrintersCompanion.insert(
      id: entity.id,
      name: entity.name,
      hostId: Value(entity.hostId),
      location: entity.location.index,
      status: entity.status.index,
      driverName: Value(entity.driverName),
      portName: Value(entity.portName),
      locationDescription: Value(entity.locationDescription),
      comment: Value(entity.comment),
      jobCount: Value(entity.jobCount),
      shared: Value(entity.shared),
      allowedGroups: Value(entity.allowedGroups.join(',')),
      lastSeen: Value(entity.lastSeen),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  static PrintersCompanion toUpdateCompanion(Printer entity) {
    return PrintersCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      hostId: Value(entity.hostId),
      location: Value(entity.location.index),
      status: Value(entity.status.index),
      driverName: Value(entity.driverName),
      portName: Value(entity.portName),
      locationDescription: Value(entity.locationDescription),
      comment: Value(entity.comment),
      jobCount: Value(entity.jobCount),
      shared: Value(entity.shared),
      allowedGroups: Value(entity.allowedGroups.join(',')),
      lastSeen: Value(entity.lastSeen),
      updatedAt: Value(DateTime.now()),
    );
  }
}

