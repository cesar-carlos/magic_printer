enum AppLogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
}

enum AppLogCategory {
  print,
  host,
  auth,
  system,
}

class AppLog {
  final String id;
  final AppLogLevel level;
  final AppLogCategory category;
  final String title;
  final String message;
  final String? details;
  final String? printerId;
  final String? hostId;
  final String? jobId;
  final DateTime createdAt;

  const AppLog({
    required this.id,
    required this.level,
    required this.category,
    required this.title,
    required this.message,
    this.details,
    this.printerId,
    this.hostId,
    this.jobId,
    required this.createdAt,
  });

  AppLog copyWith({
    String? id,
    AppLogLevel? level,
    AppLogCategory? category,
    String? title,
    String? message,
    String? details,
    String? printerId,
    String? hostId,
    String? jobId,
    DateTime? createdAt,
  }) {
    return AppLog(
      id: id ?? this.id,
      level: level ?? this.level,
      category: category ?? this.category,
      title: title ?? this.title,
      message: message ?? this.message,
      details: details ?? this.details,
      printerId: printerId ?? this.printerId,
      hostId: hostId ?? this.hostId,
      jobId: jobId ?? this.jobId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppLog && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'AppLog($level, $category, $title)';
}
