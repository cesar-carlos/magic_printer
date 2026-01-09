enum MaintenanceType {
  cleaning,
  tonerChange,
  inkChange,
  paperRefill,
  repair,
  replacement,
  other,
}

class PrinterMaintenance {
  final String id;
  final String printerId;
  final MaintenanceType type;
  final String? description;
  final String? performedBy;
  final DateTime performedAt;
  final String? notes;

  const PrinterMaintenance({
    required this.id,
    required this.printerId,
    required this.type,
    this.description,
    this.performedBy,
    required this.performedAt,
    this.notes,
  });

  PrinterMaintenance copyWith({
    String? id,
    String? printerId,
    MaintenanceType? type,
    String? description,
    String? performedBy,
    DateTime? performedAt,
    String? notes,
  }) {
    return PrinterMaintenance(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      description: description ?? this.description,
      performedBy: performedBy ?? this.performedBy,
      performedAt: performedAt ?? this.performedAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrinterMaintenance && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'PrinterMaintenance($printerId, $type at $performedAt)';
}
