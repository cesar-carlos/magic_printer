import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../application/application.dart';
import '../../infrastructure/network/host_discovery_listener.dart';
import 'safe_notifier_mixin.dart';

class HostDiscoveryProvider extends ChangeNotifier with SafeNotifierMixin {
  final NetworkDiscoveryService _networkDiscoveryService;

  HostDiscoveryProvider(this._networkDiscoveryService) {
    _initialize();
  }

  List<DiscoveredHost> _discoveredHosts = [];
  bool _isDiscovering = false;
  String? _error;
  StreamSubscription<DiscoveredHost>? _discoverySubscription;

  List<DiscoveredHost> get discoveredHosts => _discoveredHosts;
  bool get isDiscovering => _isDiscovering;
  String? get error => _error;

  void _initialize() {
    if (_networkDiscoveryService.isRunning) {
      _isDiscovering = true;
      _updateDiscoveredHosts();
      _startListening();
    }
  }

  void _startListening() {
    _discoverySubscription?.cancel();
    _discoverySubscription = _networkDiscoveryService.listener?.onHostDiscovered.listen(
      (host) {
        _updateDiscoveredHosts();
      },
    );
  }

  void _updateDiscoveredHosts() {
    _discoveredHosts = _networkDiscoveryService.discoveredHosts;
    notifyListeners();
  }

  Future<void> startDiscovery() async {
    if (_isDiscovering) return;

    _isDiscovering = true;
    _error = null;
    notifyListeners();

    try {
      if (!_networkDiscoveryService.isRunning) {
        await _networkDiscoveryService.start();
      }
      _startListening();
      _updateDiscoveredHosts();
    } catch (e) {
      _error = 'Erro ao iniciar descoberta: $e';
      _isDiscovering = false;
      notifyListeners();
    }
  }

  Future<void> stopDiscovery() async {
    if (!_isDiscovering) return;

    _isDiscovering = false;
    notifyListeners();

    await _networkDiscoveryService.stop();
  }

  Future<void> addDiscoveredHost(String hostId) async {
    final host = _networkDiscoveryService.listener?.getHost(hostId);
    if (host == null) return;

    _updateDiscoveredHosts();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _discoverySubscription?.cancel();
    super.dispose();
  }
}
