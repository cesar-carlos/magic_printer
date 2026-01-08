import '../errors/failures.dart';

class Token {
  final String value;
  final DateTime? expiresAt;

  Token._({required this.value, this.expiresAt});

  factory Token({required String value, DateTime? expiresAt}) {
    if (value.isEmpty) {
      throw ValidationException.emptyField('token');
    }
    return Token._(value: value, expiresAt: expiresAt);
  }

  factory Token.empty() => Token._(value: '');

  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  bool get isValid => isNotEmpty && !isExpired;

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Token && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
