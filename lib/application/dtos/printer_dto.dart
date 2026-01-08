class PrinterDTO {
  final String id;
  final String name;
  final String? alias; // Apelido/nome personalizado para impressora remota
  final String? hostId;
  final String location;
  final String status;
  final String? driverName;
  final String? portName;
  final String? locationDescription;
  final String? comment;
  final int jobCount;
  final bool shared;
  final List<String> allowedGroups;
  final DateTime? lastSeen;

  const PrinterDTO({
    required this.id,
    required this.name,
    this.alias,
    this.hostId,
    required this.location,
    required this.status,
    this.driverName,
    this.portName,
    this.locationDescription,
    this.comment,
    this.jobCount = 0,
    this.shared = true,
    this.allowedGroups = const [],
    this.lastSeen,
  });

  bool get isLocal => location == 'local';
  bool get isRemote => location == 'remote';
  bool get isOnline => status == 'online';
  bool get isAvailable => isOnline && status != 'paused';
  
  /// Retorna o nome de exibição (apelido se disponível, senão o nome original)
  String get displayName => alias ?? name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alias': alias,
      'hostId': hostId,
      'location': location,
      'status': status,
      'driverName': driverName,
      'portName': portName,
      'locationDescription': locationDescription,
      'comment': comment,
      'jobCount': jobCount,
      'shared': shared,
      'allowedGroups': allowedGroups,
      'lastSeen': lastSeen?.toIso8601String(),
    };
  }

  factory PrinterDTO.fromJson(Map<String, dynamic> json) {
    return PrinterDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      alias: json['alias'] as String?,
      hostId: json['hostId'] as String?,
      location: json['location'] as String,
      status: json['status'] as String,
      driverName: json['driverName'] as String?,
      portName: json['portName'] as String?,
      locationDescription: json['locationDescription'] as String?,
      comment: json['comment'] as String?,
      jobCount: json['jobCount'] as int? ?? 0,
      shared: json['shared'] as bool? ?? true,
      allowedGroups: (json['allowedGroups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'] as String)
          : null,
    );
  }
}

