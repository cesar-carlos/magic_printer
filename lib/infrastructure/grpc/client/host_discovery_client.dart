import 'dart:async';

import 'package:grpc/grpc.dart' as grpc;
import 'package:logger/logger.dart';

import '../generated/generated.dart' as pb;

class HostDiscoveryConfig {
  final String hostAddress;
  final int hostPort;
  final Duration connectTimeout;

  const HostDiscoveryConfig({
    required this.hostAddress,
    required this.hostPort,
    this.connectTimeout = const Duration(seconds: 10),
  });
}

abstract class IHostDiscoveryClient {
  Future<pb.GetHostInfoResponse?> getHostInfo();
  Future<pb.ListPrintersResponse> listPrinters(String authToken);
  Future<pb.CheckPermissionResponse> checkPermission({
    required String authToken,
    required String printerName,
    required String permission,
  });
  Future<void> close();
}

class HostDiscoveryClient implements IHostDiscoveryClient {
  final HostDiscoveryConfig config;
  final String clientId;
  final Logger _logger;

  grpc.ClientChannel? _channel;
  pb.HostDiscoveryClient? _stub;

  HostDiscoveryClient({
    required this.config,
    required this.clientId,
    Logger? logger,
  }) : _logger = logger ?? Logger() {
    _initializeChannel();
  }

  void _initializeChannel() {
    _channel = grpc.ClientChannel(
      config.hostAddress,
      port: config.hostPort,
      options: const grpc.ChannelOptions(
        credentials: grpc.ChannelCredentials.insecure(),
      ),
    );
    _stub = pb.HostDiscoveryClient(_channel!);
  }

  @override
  Future<pb.GetHostInfoResponse?> getHostInfo() async {
    _logger.d('Consultando info do host: ${config.hostAddress}:${config.hostPort}');

    try {
      final request = pb.GetHostInfoRequest()..clientId = clientId;
      return await _stub!.getHostInfo(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao consultar host info', error: e);
      return null;
    } catch (e) {
      _logger.e('Erro ao consultar host info', error: e);
      return null;
    }
  }

  @override
  Future<pb.ListPrintersResponse> listPrinters(String authToken) async {
    _logger.d('Listando impressoras do host');

    try {
      final request = pb.ListPrintersRequest()..authToken = authToken;
      return await _stub!.listPrinters(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao listar impressoras', error: e);
      return pb.ListPrintersResponse()
        ..success = false
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao listar impressoras', error: e);
      return pb.ListPrintersResponse()
        ..success = false
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  @override
  Future<pb.CheckPermissionResponse> checkPermission({
    required String authToken,
    required String printerName,
    required String permission,
  }) async {
    _logger.d('Verificando permissão: $permission em $printerName');

    try {
      final request = pb.CheckPermissionRequest()
        ..authToken = authToken
        ..printerName = printerName
        ..permission = permission;
      return await _stub!.checkPermission(request);
    } on grpc.GrpcError catch (e) {
      _logger.e('Erro gRPC ao verificar permissão', error: e);
      return pb.CheckPermissionResponse()
        ..allowed = false
        ..errorCode = 'E_GRPC_ERROR'
        ..errorMessage = 'Erro gRPC: ${e.message}';
    } catch (e) {
      _logger.e('Erro ao verificar permissão', error: e);
      return pb.CheckPermissionResponse()
        ..allowed = false
        ..errorCode = 'E_NETWORK_ERROR'
        ..errorMessage = 'Erro de rede: ${e.toString()}';
    }
  }

  @override
  Future<void> close() async {
    _logger.d('Fechando cliente de descoberta');
    await _channel?.shutdown();
    _stub = null;
    _channel = null;
  }
}
