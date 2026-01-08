class HostDTO {
  final String id;
  final String name;
  final String host;
  final int port;
  final String status;
  final bool requiresAuth;
  final String? token;
  final DateTime? lastSeen;
  final List<String> supportedFeatures;
  final String? version;

  const HostDTO({
    required this.id,
    required this.name,
    required this.host,
    required this.port,
    required this.status,
    this.requiresAuth = true,
    this.token,
    this.lastSeen,
    this.supportedFeatures = const [],
    this.version,
  });

  String get fullAddress => '$host:$port';
  bool get isOnline => status == 'online';
  bool get isAuthenticated => token != null && token!.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'host': host,
      'port': port,
      'status': status,
      'requiresAuth': requiresAuth,
      'token': token,
      'lastSeen': lastSeen?.toIso8601String(),
      'supportedFeatures': supportedFeatures,
      'version': version,
    };
  }

  factory HostDTO.fromJson(Map<String, dynamic> json) {
    return HostDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      host: json['host'] as String,
      port: json['port'] as int,
      status: json['status'] as String,
      requiresAuth: json['requiresAuth'] as bool? ?? true,
      token: json['token'] as String?,
      lastSeen: json['lastSeen'] != null
          ? DateTime.parse(json['lastSeen'] as String)
          : null,
      supportedFeatures: (json['supportedFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      version: json['version'] as String?,
    );
  }
}

