enum SupplyType {
  toner,
  ink,
  paper,
  drum,
  fuser,
  other,
}

class PrinterSupply {
  final String id;
  final String printerId;
  final SupplyType type;
  final int level;
  final String unit;
  final DateTime lastChecked;

  const PrinterSupply({
    required this.id,
    required this.printerId,
    required this.type,
    required this.level,
    required this.unit,
    required this.lastChecked,
  });

  bool get isLow => level < 20;
  bool get isCritical => level < 10;

  PrinterSupply copyWith({
    String? id,
    String? printerId,
    SupplyType? type,
    int? level,
    String? unit,
    DateTime? lastChecked,
  }) {
    return PrinterSupply(
      id: id ?? this.id,
      printerId: printerId ?? this.printerId,
      type: type ?? this.type,
      level: level ?? this.level,
      unit: unit ?? this.unit,
      lastChecked: lastChecked ?? this.lastChecked,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is PrinterSupply && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'PrinterSupply($printerId, $type: $level$unit)';
}
