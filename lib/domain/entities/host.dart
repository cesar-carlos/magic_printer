import '../value_objects/host_address.dart';
import '../value_objects/token.dart';

enum HostStatus {
  online,
  offline,
  connecting,
  error,
}

class Host {
  final String id;
  final String name;
  final HostAddress address;
  final HostStatus status;
  final bool requiresAuth;
  final Token? token;
  final DateTime? lastSeen;
  final List<String> supportedFeatures;
  final String? version;

  const Host({
    required this.id,
    required this.name,
    required this.address,
    this.status = HostStatus.offline,
    this.requiresAuth = true,
    this.token,
    this.lastSeen,
    this.supportedFeatures = const [],
    this.version,
  });

  bool get isOnline => status == HostStatus.online;
  bool get isAuthenticated => !requiresAuth || (token != null && token!.isValid);

  Host copyWith({
    String? id,
    String? name,
    HostAddress? address,
    HostStatus? status,
    bool? requiresAuth,
    Token? token,
    DateTime? lastSeen,
    List<String>? supportedFeatures,
    String? version,
  }) {
    return Host(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      status: status ?? this.status,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      token: token ?? this.token,
      lastSeen: lastSeen ?? this.lastSeen,
      supportedFeatures: supportedFeatures ?? this.supportedFeatures,
      version: version ?? this.version,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Host && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Host($name, ${address.fullAddress}, $status)';
}

