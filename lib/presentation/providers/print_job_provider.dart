import 'package:flutter/foundation.dart';

import '../../application/application.dart';
import 'safe_notifier_mixin.dart';

class PrintJobProvider extends ChangeNotifier with SafeNotifierMixin {
  final PrintJobService _printJobService;

  PrintJobProvider(this._printJobService);

  List<PrintJobDTO> _jobs = [];
  bool _isLoading = false;
  String? _error;
  PrintJobDTO? _selectedJob;

  List<PrintJobDTO> get jobs => _jobs;
  bool get isLoading => _isLoading;
  String? get error => _error;
  PrintJobDTO? get selectedJob => _selectedJob;

  List<PrintJobDTO> get pendingJobs =>
      _jobs.where((j) => j.status == 'pending').toList();

  List<PrintJobDTO> get inProgressJobs =>
      _jobs.where((j) => j.status == 'in_progress').toList();

  List<PrintJobDTO> get completedJobs =>
      _jobs.where((j) => j.status == 'completed').toList();

  List<PrintJobDTO> get failedJobs =>
      _jobs.where((j) => j.status == 'failed').toList();

  Future<void> loadJobHistory({int limit = 50}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printJobService.getJobHistory(limit: limit);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar histórico de jobs';
      _isLoading = false;
    } else {
      _jobs = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> sendPrintJob(SendPrintJobRequestDTO request) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printJobService.sendPrintJob(request);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao enviar job de impressão';
      _isLoading = false;
    } else {
      final job = result.getOrThrow();
      _jobs.insert(0, job);
      _selectedJob = job;
      _isLoading = false;
    }

    notifyListeners();
  }

  void selectJob(PrintJobDTO? job) {
    _selectedJob = job;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}

