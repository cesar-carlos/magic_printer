abstract class AppException implements Exception {
  final String code;
  final String message;

  const AppException(this.code, this.message);

  @override
  String toString() => '$code: $message';
}

class NetworkException extends AppException {
  const NetworkException(super.code, super.message);

  factory NetworkException.hostOffline(String host) =>
      NetworkException('E_HOST_OFFLINE', 'Host não disponível: $host');

  factory NetworkException.timeout() =>
      const NetworkException('E_TIMEOUT', 'Tempo de conexão esgotado');

  factory NetworkException.connectionRefused() =>
      const NetworkException('E_CONNECTION_REFUSED', 'Conexão recusada pelo host');
}

class AuthException extends AppException {
  const AuthException(super.code, super.message);

  factory AuthException.invalidToken() =>
      const AuthException('E_AUTH_INVALID_TOKEN', 'Token inválido ou expirado');

  factory AuthException.tokenExpired() =>
      const AuthException('E_AUTH_TOKEN_EXPIRED', 'Token expirado');

  factory AuthException.unauthorized() =>
      const AuthException('E_AUTH_UNAUTHORIZED', 'Não autorizado');
}

class PermissionException extends AppException {
  const PermissionException(String message)
      : super('E_PERMISSION_DENIED', message);

  factory PermissionException.noPrintPermission(String printer) =>
      PermissionException('Sem permissão para imprimir em: $printer');

  factory PermissionException.noAccessToHost(String host) =>
      PermissionException('Sem acesso ao host: $host');
}

class PrinterException extends AppException {
  const PrinterException(super.code, super.message);

  factory PrinterException.notFound(String printer) =>
      PrinterException('E_PRINTER_NOT_FOUND', 'Impressora não encontrada: $printer');

  factory PrinterException.offline(String printer) =>
      PrinterException('E_PRINTER_OFFLINE', 'Impressora offline: $printer');

  factory PrinterException.error(String printer, String error) =>
      PrinterException('E_PRINTER_ERROR', 'Erro na impressora $printer: $error');

  factory PrinterException.busy(String printer) =>
      PrinterException('E_PRINTER_BUSY', 'Impressora ocupada: $printer');
}

class SpoolerException extends AppException {
  const SpoolerException(super.code, super.message);

  factory SpoolerException.injectionFailed() =>
      const SpoolerException('E_SPOOLER_INJECTION_FAILED', 'Falha ao injetar job no spooler');

  factory SpoolerException.captureFailed() =>
      const SpoolerException('E_SPOOLER_CAPTURE_FAILED', 'Falha ao capturar job do spooler');

  factory SpoolerException.operationFailed(String operation) => SpoolerException(
        'E_SPOOLER_OPERATION_FAILED',
        'Falha ao executar operação no spooler: $operation',
      );

  factory SpoolerException.serviceUnavailable() =>
      const SpoolerException('E_SPOOLER_UNAVAILABLE', 'Serviço de spooler não disponível');
}

class TransportException extends AppException {
  const TransportException(super.code, super.message);

  factory TransportException.checksumMismatch() =>
      const TransportException('E_CHECKSUM_MISMATCH', 'Checksum não confere');

  factory TransportException.chunkFailed(int index) =>
      TransportException('E_CHUNK_FAILED', 'Falha ao enviar chunk $index');

  factory TransportException.jobNotFound(String jobId) =>
      TransportException('E_JOB_NOT_FOUND', 'Job não encontrado: $jobId');

  factory TransportException.maxRetriesExceeded() =>
      const TransportException('E_MAX_RETRIES', 'Número máximo de tentativas excedido');
}

class ValidationException extends AppException {
  const ValidationException(String message) : super('E_VALIDATION', message);

  factory ValidationException.emptyField(String field) =>
      ValidationException('Campo obrigatório vazio: $field');

  factory ValidationException.invalidFormat(String field) =>
      ValidationException('Formato inválido: $field');
}

class ConfigException extends AppException {
  const ConfigException(super.code, super.message);

  factory ConfigException.missingConfig(String key) =>
      ConfigException('E_CONFIG_MISSING', 'Configuração não encontrada: $key');

  factory ConfigException.invalidConfig(String key) =>
      ConfigException('E_CONFIG_INVALID', 'Configuração inválida: $key');
}

class StorageException extends AppException {
  const StorageException(super.code, super.message);

  factory StorageException.readFailed(String path) =>
      StorageException('E_STORAGE_READ', 'Falha ao ler: $path');

  factory StorageException.writeFailed(String path) =>
      StorageException('E_STORAGE_WRITE', 'Falha ao escrever: $path');

  factory StorageException.notFound(String path) =>
      StorageException('E_STORAGE_NOT_FOUND', 'Arquivo não encontrado: $path');
}
