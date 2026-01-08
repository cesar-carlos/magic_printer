import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import 'safe_notifier_mixin.dart';

class LogProvider extends ChangeNotifier with SafeNotifierMixin {
  final AppLogService _logService;

  StreamSubscription<AppLog>? _logSubscription;
  List<AppLog> _logs = [];
  bool _isLoading = false;
  String? _error;

  AppLogFilters? _activeFilters;
  String _searchQuery = '';

  LogProvider(this._logService) {
    _initialize();
  }

  List<AppLog> get logs => _logs;
  bool get isLoading => _isLoading;
  String? get error => _error;
  AppLogFilters? get activeFilters => _activeFilters;
  String get searchQuery => _searchQuery;

  List<AppLog> get filteredLogs {
    if (_searchQuery.isEmpty) {
      return _logs;
    }
    return _logs.where((log) {
      return log.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          log.message.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void _initialize() {
    _logSubscription = _logService.watchLogs().listen((log) {
      _logs.insert(0, log);
      if (_logs.length > 1000) {
        _logs = _logs.sublist(0, 1000);
      }
      notifyListeners();
    });

    loadLogs();
  }

  Future<void> loadLogs({int limit = 100}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _logService.getAll(
      filters: _activeFilters,
      limit: limit,
    );

    if (result.isError()) {
      _error = result.exceptionOrNull()?.toString();
      _isLoading = false;
    } else {
      _logs = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  void setFilters(AppLogFilters? filters) {
    _activeFilters = filters;
    loadLogs();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _searchQuery = '';
      await loadLogs();
      return;
    }

    _isLoading = true;
    _error = null;
    _searchQuery = query;
    notifyListeners();

    final result = await _logService.search(query);

    if (result.isError()) {
      _error = result.exceptionOrNull()?.toString();
      _isLoading = false;
    } else {
      _logs = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<String?> exportToCsv() async {
    final result = await _logService.exportToCsv(filters: _activeFilters);

    if (result.isError()) {
      _error = result.exceptionOrNull()?.toString();
      notifyListeners();
      return null;
    }

    final csvContent = result.getOrThrow();
    return await _saveToFile('logs.csv', csvContent);
  }

  Future<String?> exportToJson() async {
    final result = await _logService.exportToJson(filters: _activeFilters);

    if (result.isError()) {
      _error = result.exceptionOrNull()?.toString();
      notifyListeners();
      return null;
    }

    final jsonContent = result.getOrThrow();
    return await _saveToFile('logs.json', jsonContent);
  }

  Future<void> deleteOldLogs({int daysToKeep = 30}) async {
    final date = DateTime.now().subtract(Duration(days: daysToKeep));
    final result = await _logService.deleteOlderThan(date);

    if (result.isSuccess()) {
      await loadLogs();
    } else {
      _error = result.exceptionOrNull()?.toString();
      notifyListeners();
    }
  }

  Future<String> _saveToFile(String filename, String content) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$filename');
    await file.writeAsString(content);
    return file.path;
  }

  @override
  void dispose() {
    _logSubscription?.cancel();
    super.dispose();
  }
}
