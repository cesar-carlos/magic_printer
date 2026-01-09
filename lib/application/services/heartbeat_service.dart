import 'dart:async';

import 'package:logger/logger.dart';

import '../../core/constants/app_constants.dart';
import '../../domain/domain.dart';
import '../../infrastructure/grpc/client/host_discovery_client.dart';

class HeartbeatService {
  final IHostRepository _hostRepository;
  final Logger _logger;

  Timer? _heartbeatTimer;
  bool _isRunning = false;
  bool _isChecking = false;

  HeartbeatService({
    required IHostRepository hostRepository,
    Logger? logger,
  })  : _hostRepository = hostRepository,
        _logger = logger ?? Logger();

  bool get isRunning => _isRunning;

  Future<void> start() async {
    if (_isRunning) {
      _logger.w('HeartbeatService já está rodando');
      return;
    }

    _isRunning = true;
    _heartbeatTimer = Timer.periodic(defaultHeartbeatInterval, (_) {
      _checkHosts();
    });

    _checkHosts();
    _logger.i('HeartbeatService iniciado');
  }

  Future<void> _checkHosts() async {
    if (_isChecking) return;

    _isChecking = true;

    try {
      final hostsResult = await _hostRepository.getAll();
      if (hostsResult.isError()) {
        return;
      }

      final hosts = hostsResult.getOrThrow();

      for (final host in hosts) {
        if (host.status == HostStatus.offline) {
          final lastSeen = host.lastSeen;
          if (lastSeen != null) {
            final timeSinceLastSeen = DateTime.now().difference(lastSeen);
            if (timeSinceLastSeen > const Duration(minutes: 5)) {
              continue;
            }
          }
        }

        await _checkHostStatus(host);
      }
    } catch (e) {
      _logger.e('Erro ao verificar hosts', error: e);
    } finally {
      _isChecking = false;
    }
  }

  Future<void> _checkHostStatus(Host host) async {
    try {
      final config = HostDiscoveryConfig(
        hostAddress: host.address.host,
        hostPort: host.address.port,
        connectTimeout: const Duration(seconds: 5),
      );

      final client = HostDiscoveryClient(
        config: config,
        clientId: 'magic_printer_heartbeat',
      );

      try {
        final info = await client.getHostInfo().timeout(
              const Duration(seconds: 5),
            );

        if (info == null) {
          if (host.status != HostStatus.offline) {
            final updated = host.copyWith(
              status: HostStatus.offline,
            );
            await _hostRepository.update(updated);
            _logger.d('Host marcado como offline: ${host.name}');
          }
        } else {
          final updated = host.copyWith(
            status: HostStatus.online,
            name: info.hostName.isNotEmpty ? info.hostName : host.name,
            requiresAuth: info.requiresAuth,
            supportedFeatures: info.supportedFeatures,
            version: info.version.isNotEmpty ? info.version : host.version,
            lastSeen: DateTime.now(),
          );
          await _hostRepository.update(updated);
        }
      } finally {
        await client.close();
      }
    } catch (e) {
      if (host.status != HostStatus.offline) {
        final updated = host.copyWith(
          status: HostStatus.offline,
        );
        await _hostRepository.update(updated);
        _logger.d('Host marcado como offline (erro): ${host.name}');
      }
    }
  }

  Future<void> stop() async {
    if (!_isRunning) return;

    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;

    _isRunning = false;
    _logger.i('HeartbeatService parado');
  }

  void dispose() {
    stop();
  }
}
