import '../errors/failures.dart';

class HostAddress {
  final String host;
  final int port;

  HostAddress._({required this.host, required this.port});

  factory HostAddress({required String host, required int port}) {
    if (host.isEmpty) {
      throw ValidationException.emptyField('host');
    }
    if (port < 1 || port > 65535) {
      throw ValidationException.invalidFormat('port deve ser entre 1 e 65535');
    }
    return HostAddress._(host: host, port: port);
  }

  factory HostAddress.fromString(String address) {
    final parts = address.split(':');
    if (parts.length != 2) {
      throw ValidationException.invalidFormat('address deve ser host:port');
    }

    final host = parts[0];
    final port = int.tryParse(parts[1]);

    if (port == null) {
      throw ValidationException.invalidFormat('port inválido');
    }

    return HostAddress(host: host, port: port);
  }

  String get fullAddress => '$host:$port';

  @override
  String toString() => fullAddress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HostAddress && host == other.host && port == other.port;

  @override
  int get hashCode => host.hashCode ^ port.hashCode;
}
