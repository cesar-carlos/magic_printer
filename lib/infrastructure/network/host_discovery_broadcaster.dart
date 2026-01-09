import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import '../../core/constants/app_constants.dart';

class HostDiscoveryBroadcaster {
  final String hostId;
  final String hostName;
  final String localIp;
  final int grpcPort;
  final String version;
  final Logger _logger;

  RawDatagramSocket? _socket;
  Timer? _broadcastTimer;
  bool _isRunning = false;

  HostDiscoveryBroadcaster({
    required this.hostId,
    required this.hostName,
    required this.localIp,
    required this.grpcPort,
    this.version = appVersion,
    Logger? logger,
  }) : _logger = logger ?? Logger();

  bool get isRunning => _isRunning;

  Future<void> start() async {
    if (_isRunning) {
      _logger.w('Broadcaster já está rodando');
      return;
    }

    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        0,
        reuseAddress: true,
        reusePort: false,
      );

      _socket!.broadcastEnabled = true;

      _isRunning = true;
      _logger.i('Broadcaster iniciado em ${_socket!.address}:${_socket!.port}');

      _broadcastTimer = Timer.periodic(defaultBroadcastInterval, (_) {
        _sendBroadcast();
      });

      _sendBroadcast();
    } catch (e) {
      _logger.e('Erro ao iniciar broadcaster', error: e);
      _isRunning = false;
    }
  }

  void _sendBroadcast() {
    if (!_isRunning || _socket == null) return;

    try {
      final announcement = {
        'hostId': hostId,
        'hostName': hostName,
        'ip': localIp,
        'port': grpcPort,
        'version': version,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };

      final jsonData = jsonEncode(announcement);
      final data = utf8.encode(jsonData);

      InternetAddress? targetAddress;

      try {
        targetAddress = InternetAddress(defaultMulticastAddress);
      } catch (_) {
        targetAddress = InternetAddress('255.255.255.255');
      }

      _socket!.send(
        data,
        targetAddress,
        defaultDiscoveryPort,
      );

      _logger.d('Anúncio enviado: $hostName ($localIp:$grpcPort)');
    } catch (e) {
      _logger.e('Erro ao enviar broadcast', error: e);
    }
  }

  Future<void> stop() async {
    if (!_isRunning) return;

    _broadcastTimer?.cancel();
    _broadcastTimer = null;

    _socket?.close();
    _socket = null;

    _isRunning = false;
    _logger.i('Broadcaster parado');
  }

  void dispose() {
    stop();
  }
}
