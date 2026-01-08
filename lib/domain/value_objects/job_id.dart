import 'package:uuid/uuid.dart';

import '../errors/failures.dart';

class JobId {
  final String value;

  JobId._({required this.value});

  factory JobId({required String value}) {
    if (value.isEmpty) {
      throw ValidationException.emptyField('jobId');
    }
    return JobId._(value: value);
  }

  factory JobId.generate() {
    return JobId._(value: const Uuid().v4());
  }

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JobId && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
