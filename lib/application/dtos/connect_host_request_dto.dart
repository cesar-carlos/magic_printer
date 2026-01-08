class ConnectHostRequestDTO {
  final String hostId;
  final String? username;
  final String? password;

  const ConnectHostRequestDTO({
    required this.hostId,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'hostId': hostId,
      'username': username,
      'password': password,
    };
  }

  factory ConnectHostRequestDTO.fromJson(Map<String, dynamic> json) {
    return ConnectHostRequestDTO(
      hostId: json['hostId'] as String,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );
  }
}

