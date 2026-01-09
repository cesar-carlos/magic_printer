enum PrinterStatus {
  online,
  offline,
  error,
  paused,
  printing,
  unknown,
}

enum PrinterLocation {
  local,
  remote,
}

class Printer {
  final String id;
  final String name;
  final String? alias; // Apelido/nome personalizado para impressora remota
  final String? hostId;
  final PrinterLocation location;
  final PrinterStatus status;
  final String? driverName;
  final String? portName;
  final String? locationDescription;
  final String? comment;
  final int jobCount;
  final bool shared;
  final List<String> allowedGroups;
  final DateTime? lastSeen;
  final int totalPagesPrinted;
  final String? tonerLevel;
  final String? paperLevel;
  final DateTime? lastMaintenanceDate;

  const Printer({
    required this.id,
    required this.name,
    this.alias,
    this.hostId,
    required this.location,
    this.status = PrinterStatus.unknown,
    this.driverName,
    this.portName,
    this.locationDescription,
    this.comment,
    this.jobCount = 0,
    this.shared = true,
    this.allowedGroups = const [],
    this.lastSeen,
    this.totalPagesPrinted = 0,
    this.tonerLevel,
    this.paperLevel,
    this.lastMaintenanceDate,
  });

  bool get isLocal => location == PrinterLocation.local;
  bool get isRemote => location == PrinterLocation.remote;
  bool get isOnline => status == PrinterStatus.online;
  bool get isAvailable => isOnline && status != PrinterStatus.paused;
  
  /// Retorna o nome de exibição (apelido se disponível, senão o nome original)
  String get displayName => alias ?? name;

  String get statusDescription {
    switch (status) {
      case PrinterStatus.online:
        return jobCount > 0 ? 'Online ($jobCount jobs)' : 'Online';
      case PrinterStatus.offline:
        return 'Offline';
      case PrinterStatus.error:
        return 'Erro';
      case PrinterStatus.paused:
        return 'Pausada';
      case PrinterStatus.printing:
        return 'Imprimindo';
      case PrinterStatus.unknown:
        return 'Desconhecido';
    }
  }

  Printer copyWith({
    String? id,
    String? name,
    String? alias,
    String? hostId,
    PrinterLocation? location,
    PrinterStatus? status,
    String? driverName,
    String? portName,
    String? locationDescription,
    String? comment,
    int? jobCount,
    bool? shared,
    List<String>? allowedGroups,
    DateTime? lastSeen,
    int? totalPagesPrinted,
    String? tonerLevel,
    String? paperLevel,
    DateTime? lastMaintenanceDate,
  }) {
    return Printer(
      id: id ?? this.id,
      name: name ?? this.name,
      alias: alias ?? this.alias,
      hostId: hostId ?? this.hostId,
      location: location ?? this.location,
      status: status ?? this.status,
      driverName: driverName ?? this.driverName,
      portName: portName ?? this.portName,
      locationDescription: locationDescription ?? this.locationDescription,
      comment: comment ?? this.comment,
      jobCount: jobCount ?? this.jobCount,
      shared: shared ?? this.shared,
      allowedGroups: allowedGroups ?? this.allowedGroups,
      lastSeen: lastSeen ?? this.lastSeen,
      totalPagesPrinted: totalPagesPrinted ?? this.totalPagesPrinted,
      tonerLevel: tonerLevel ?? this.tonerLevel,
      paperLevel: paperLevel ?? this.paperLevel,
      lastMaintenanceDate:
          lastMaintenanceDate ?? this.lastMaintenanceDate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Printer && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Printer($name, $location, $status)';
}

