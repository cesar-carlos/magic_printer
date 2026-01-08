/// Interface simplificada para autenticação/autorização no contexto do gRPC server
/// 
/// Esta interface é usada pelos serviços gRPC para validação rápida de tokens
/// e permissões. É uma abstração sobre IAuthenticationService e IAuthorizationService
/// do domain layer, adaptada para uso síncrono no contexto do servidor gRPC.
abstract class IGrpcAuthService {
  /// Valida se um token é válido (síncrono para uso no gRPC)
  bool validateToken(String token);

  /// Verifica se um token tem permissão para uma operação específica em uma impressora
  bool checkPermission(String token, String printerName, String permission);
}

