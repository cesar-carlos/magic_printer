import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart' as grpc;
import 'package:logger/logger.dart';

import 'host_discovery_service.dart';
import 'job_transport_service.dart';

class GrpcServer {
  final JobTransportServiceImpl _jobTransportService;
  final HostDiscoveryServiceImpl _hostDiscoveryService;
  final Logger _logger;
  final int port;
  final String bindAddress;

  grpc.Server? _server;
  bool _isRunning = false;

  GrpcServer({
    required JobTransportServiceImpl jobTransportService,
    required HostDiscoveryServiceImpl hostDiscoveryService,
    required this.port,
    this.bindAddress = '0.0.0.0',
    Logger? logger,
  })  : _jobTransportService = jobTransportService,
        _hostDiscoveryService = hostDiscoveryService,
        _logger = logger ?? Logger();

  bool get isRunning => _isRunning;

  Future<void> start() async {
    if (_isRunning) {
      _logger.w('Servidor já está rodando');
      return;
    }

    _server = grpc.Server.create(
      services: [
        _jobTransportService,
        _hostDiscoveryService,
      ],
    );

    final address =
        InternetAddress.tryParse(bindAddress) ?? InternetAddress.anyIPv4;

    await _server!.serve(address: address, port: port);

    _isRunning = true;
    _logger.i('Servidor gRPC iniciado em $bindAddress:$port');
  }

  Future<void> stop() async {
    if (!_isRunning || _server == null) {
      return;
    }

    await _server!.shutdown();
    _isRunning = false;
    _logger.i('Servidor gRPC parado');
  }

  void dispose() {
    stop();
    _jobTransportService.dispose();
  }
}
