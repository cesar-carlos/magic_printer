import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import '../../core/constants/app_constants.dart';

class DiscoveredHost {
  final String hostId;
  final String hostName;
  final String ip;
  final int port;
  final String version;
  final DateTime discoveredAt;
  final DateTime lastSeen;

  DiscoveredHost({
    required this.hostId,
    required this.hostName,
    required this.ip,
    required this.port,
    required this.version,
    required this.discoveredAt,
    required this.lastSeen,
  });

  DiscoveredHost copyWith({
    String? hostId,
    String? hostName,
    String? ip,
    int? port,
    String? version,
    DateTime? discoveredAt,
    DateTime? lastSeen,
  }) {
    return DiscoveredHost(
      hostId: hostId ?? this.hostId,
      hostName: hostName ?? this.hostName,
      ip: ip ?? this.ip,
      port: port ?? this.port,
      version: version ?? this.version,
      discoveredAt: discoveredAt ?? this.discoveredAt,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscoveredHost &&
          runtimeType == other.runtimeType &&
          hostId == other.hostId;

  @override
  int get hashCode => hostId.hashCode;
}

class HostDiscoveryListener {
  final String localHostId;
  final Logger _logger;

  RawDatagramSocket? _socket;
  StreamSubscription<RawSocketEvent>? _subscription;
  bool _isRunning = false;

  final _discoveredHostsController =
      StreamController<DiscoveredHost>.broadcast();
  final _hostsCache = <String, DiscoveredHost>{};
  final Map<String, Timer> _timeoutTimers = {};

  Stream<DiscoveredHost> get onHostDiscovered =>
      _discoveredHostsController.stream;

  HostDiscoveryListener({
    required this.localHostId,
    Logger? logger,
  }) : _logger = logger ?? Logger();

  bool get isRunning => _isRunning;

  Future<void> start() async {
    if (_isRunning) {
      _logger.w('Listener já está rodando');
      return;
    }

    try {
      _socket = await RawDatagramSocket.bind(
        InternetAddress.anyIPv4,
        defaultDiscoveryPort,
        reuseAddress: true,
        reusePort: true,
      );

      _isRunning = true;
      _logger.i('Listener iniciado na porta $defaultDiscoveryPort');

      _subscription = _socket!.listen(
        _handleDatagram,
        onError: (error) {
          _logger.e('Erro no listener', error: error);
        },
      );
    } catch (e) {
      _logger.e('Erro ao iniciar listener', error: e);
      _isRunning = false;
    }
  }

  void _handleDatagram(RawSocketEvent event) {
    if (event != RawSocketEvent.read) return;
    if (_socket == null) return;

    try {
      final datagram = _socket!.receive();
      if (datagram == null) return;

      final data = utf8.decode(datagram.data);
      final json = jsonDecode(data) as Map<String, dynamic>;

      final hostId = json['hostId'] as String?;
      final hostName = json['hostName'] as String?;
      final ip = json['ip'] as String?;
      final port = json['port'] as int?;
      final version = json['version'] as String? ?? appVersion;

      if (hostId == null || hostName == null || ip == null || port == null) {
        _logger.w('Anúncio inválido recebido');
        return;
      }

      if (hostId == localHostId) {
        return;
      }

      final now = DateTime.now();
      final existingHost = _hostsCache[hostId];

      if (existingHost != null) {
        final updated = existingHost.copyWith(
          hostName: hostName,
          ip: ip,
          port: port,
          version: version,
          lastSeen: now,
        );
        _hostsCache[hostId] = updated;
        _resetTimeoutTimer(hostId);
      } else {
        final discovered = DiscoveredHost(
          hostId: hostId,
          hostName: hostName,
          ip: ip,
          port: port,
          version: version,
          discoveredAt: now,
          lastSeen: now,
        );
        _hostsCache[hostId] = discovered;
        _discoveredHostsController.add(discovered);
        _logger.i('Host descoberto: $hostName ($ip:$port)');
        _resetTimeoutTimer(hostId);
      }
    } catch (e) {
      _logger.e('Erro ao processar datagrama', error: e);
    }
  }

  void _resetTimeoutTimer(String hostId) {
    _timeoutTimers[hostId]?.cancel();

    _timeoutTimers[hostId] = Timer(defaultHostTimeout, () {
      final host = _hostsCache.remove(hostId);
      if (host != null) {
        _logger.i('Host perdido (timeout): ${host.hostName}');
      }
      _timeoutTimers.remove(hostId);
    });
  }

  List<DiscoveredHost> get discoveredHosts => _hostsCache.values.toList();

  DiscoveredHost? getHost(String hostId) => _hostsCache[hostId];

  Future<void> stop() async {
    if (!_isRunning) return;

    _subscription?.cancel();
    _subscription = null;

    for (final timer in _timeoutTimers.values) {
      timer.cancel();
    }
    _timeoutTimers.clear();

    _socket?.close();
    _socket = null;

    _isRunning = false;
    _logger.i('Listener parado');
  }

  void clearCache() {
    _hostsCache.clear();
    for (final timer in _timeoutTimers.values) {
      timer.cancel();
    }
    _timeoutTimers.clear();
  }

  void dispose() {
    stop();
    clearCache();
    _discoveredHostsController.close();
  }
}
