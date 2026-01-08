import 'package:flutter/foundation.dart';

import '../../application/application.dart';
import 'safe_notifier_mixin.dart';

class HostProvider extends ChangeNotifier with SafeNotifierMixin {
  final HostService _hostService;

  HostProvider(this._hostService);

  List<HostDTO> _hosts = [];
  bool _isLoading = false;
  String? _error;
  HostDTO? _selectedHost;

  List<HostDTO> get hosts => _hosts;
  bool get isLoading => _isLoading;
  String? get error => _error;
  HostDTO? get selectedHost => _selectedHost;

  Future<void> loadHosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _hostService.getAllHosts();

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar hosts';
      _isLoading = false;
    } else {
      _hosts = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> addHost(AddHostRequestDTO request) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _hostService.addHost(request);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao adicionar host';
      _isLoading = false;
    } else {
      _hosts.add(result.getOrThrow());
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> connectToHost(ConnectHostRequestDTO request) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _hostService.connectHost(request);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao conectar ao host';
      _isLoading = false;
    } else {
      final host = result.getOrThrow();
      final index = _hosts.indexWhere((h) => h.id == host.id);
      if (index >= 0) {
        _hosts[index] = host;
      } else {
        _hosts.add(host);
      }
      _selectedHost = host;
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> refreshHost(String hostId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _hostService.refreshHost(hostId);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao atualizar host';
      _isLoading = false;
    } else {
      final host = result.getOrThrow();
      final index = _hosts.indexWhere((h) => h.id == host.id);
      if (index >= 0) {
        _hosts[index] = host;
      }
      if (_selectedHost?.id == host.id) {
        _selectedHost = host;
      }
      _isLoading = false;
    }

    notifyListeners();
  }

  void selectHost(HostDTO? host) {
    _selectedHost = host;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}

