class User {
  final String id;
  final String username;
  final String? displayName;
  final String? department;
  final String? email;
  final List<String> groupIds;
  final DateTime createdAt;
  final DateTime? lastSeen;

  const User({
    required this.id,
    required this.username,
    this.displayName,
    this.department,
    this.email,
    this.groupIds = const [],
    required this.createdAt,
    this.lastSeen,
  });

  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? department,
    String? email,
    List<String>? groupIds,
    DateTime? createdAt,
    DateTime? lastSeen,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      department: department ?? this.department,
      email: email ?? this.email,
      groupIds: groupIds ?? this.groupIds,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is User && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'User($username)';
}
