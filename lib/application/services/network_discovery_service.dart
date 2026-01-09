import 'dart:async';

import 'package:logger/logger.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/network_utils.dart';
import '../../domain/domain.dart';
import '../../infrastructure/network/host_discovery_broadcaster.dart';
import '../../infrastructure/network/host_discovery_listener.dart';

class NetworkDiscoveryService {
  final IHostRepository _hostRepository;
  final String localHostId;
  final String localHostName;
  final int grpcPort;
  final Logger _logger;

  HostDiscoveryBroadcaster? _broadcaster;
  HostDiscoveryListener? _listener;
  StreamSubscription<DiscoveredHost>? _discoverySubscription;
  bool _isRunning = false;
  String? _localIp;

  NetworkDiscoveryService({
    required IHostRepository hostRepository,
    required this.localHostId,
    required this.localHostName,
    required this.grpcPort,
    Logger? logger,
  })  : _hostRepository = hostRepository,
        _logger = logger ?? Logger();

  bool get isRunning => _isRunning;

  HostDiscoveryListener? get listener => _listener;

  List<DiscoveredHost> get discoveredHosts =>
      _listener?.discoveredHosts ?? [];

  Future<void> start() async {
    if (_isRunning) {
      _logger.w('NetworkDiscoveryService já está rodando');
      return;
    }

    try {
      _localIp = await getLocalIpAddress();
      if (_localIp == null) {
        _logger.w('Não foi possível obter IP local, descoberta não iniciada');
        return;
      }

      _broadcaster = HostDiscoveryBroadcaster(
        hostId: localHostId,
        hostName: localHostName,
        localIp: _localIp!,
        grpcPort: grpcPort,
        version: appVersion,
        logger: _logger,
      );

      _listener = HostDiscoveryListener(
        localHostId: localHostId,
        logger: _logger,
      );

      await _broadcaster!.start();
      await _listener!.start();

      _discoverySubscription = _listener!.onHostDiscovered.listen(
        _handleHostDiscovered,
      );

      _isRunning = true;
      _logger.i('NetworkDiscoveryService iniciado');
    } catch (e) {
      _logger.e('Erro ao iniciar NetworkDiscoveryService', error: e);
      await stop();
    }
  }

  Future<void> _handleHostDiscovered(DiscoveredHost discovered) async {
    try {
      final existingResult = await _hostRepository.getById(discovered.hostId);

      if (existingResult.isSuccess()) {
        final existing = existingResult.getOrThrow();
        if (existing.address.host != discovered.ip ||
            existing.address.port != discovered.port) {
          final updated = existing.copyWith(
            name: discovered.hostName,
            address: HostAddress(
              host: discovered.ip,
              port: discovered.port,
            ),
            version: discovered.version,
            lastSeen: discovered.lastSeen,
          );
          await _hostRepository.update(updated);
          _logger.d('Host atualizado: ${discovered.hostName}');
        }
      } else {
        final newHost = Host(
          id: discovered.hostId,
          name: discovered.hostName,
          address: HostAddress(
            host: discovered.ip,
            port: discovered.port,
          ),
          status: HostStatus.offline,
          requiresAuth: false,
          version: discovered.version,
          lastSeen: discovered.lastSeen,
        );

        await _hostRepository.add(newHost);
        _logger.i('Host adicionado automaticamente: ${discovered.hostName}');
      }
    } catch (e) {
      _logger.e('Erro ao processar host descoberto', error: e);
    }
  }

  Future<void> stop() async {
    if (!_isRunning) return;

    await _discoverySubscription?.cancel();
    _discoverySubscription = null;

    await _broadcaster?.stop();
    _broadcaster = null;

    await _listener?.stop();
    _listener = null;

    _isRunning = false;
    _logger.i('NetworkDiscoveryService parado');
  }

  void dispose() {
    stop();
  }
}
