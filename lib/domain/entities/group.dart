class Group {
  final String id;
  final String name;
  final String? description;
  final List<String> permissions;
  final List<String> memberIds;
  final DateTime createdAt;

  const Group({
    required this.id,
    required this.name,
    this.description,
    this.permissions = const [],
    this.memberIds = const [],
    required this.createdAt,
  });

  bool hasPermission(String permission) => permissions.contains(permission);
  bool hasMember(String memberId) => memberIds.contains(memberId);

  Group copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? permissions,
    List<String>? memberIds,
    DateTime? createdAt,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      permissions: permissions ?? this.permissions,
      memberIds: memberIds ?? this.memberIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Group && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Group($name)';
}

class Permission {
  static const print = 'print';
  static const manage = 'manage';
  static const viewQueue = 'view_queue';
  static const cancelJobs = 'cancel_jobs';
  static const pausePrinter = 'pause_printer';
  static const adminHost = 'admin_host';

  static const allPrinterPermissions = [
    print,
    manage,
    viewQueue,
    cancelJobs,
    pausePrinter,
  ];

  static const allHostPermissions = [
    adminHost,
  ];
}

