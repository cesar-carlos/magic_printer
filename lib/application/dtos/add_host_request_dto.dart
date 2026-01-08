class AddHostRequestDTO {
  final String name;
  final String host;
  final int port;

  const AddHostRequestDTO({
    required this.name,
    required this.host,
    required this.port,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'host': host,
      'port': port,
    };
  }

  factory AddHostRequestDTO.fromJson(Map<String, dynamic> json) {
    return AddHostRequestDTO(
      name: json['name'] as String,
      host: json['host'] as String,
      port: json['port'] as int,
    );
  }
}

