import 'package:flutter/foundation.dart';

import '../../application/application.dart';
import 'safe_notifier_mixin.dart';

class PrinterProvider extends ChangeNotifier with SafeNotifierMixin {
  final PrinterService _printerService;

  PrinterProvider(this._printerService);

  List<PrinterDTO> _printers = [];
  bool _isLoading = false;
  String? _error;
  PrinterDTO? _selectedPrinter;

  List<PrinterDTO> get printers => _printers;
  bool get isLoading => _isLoading;
  String? get error => _error;
  PrinterDTO? get selectedPrinter => _selectedPrinter;

  List<PrinterDTO> get localPrinters =>
      _printers.where((p) => p.isLocal).toList();

  List<PrinterDTO> get remotePrinters =>
      _printers.where((p) => p.isRemote).toList();

  List<PrinterDTO> get onlinePrinters =>
      _printers.where((p) => p.isOnline).toList();

  List<PrinterDTO> get offlinePrinters =>
      _printers.where((p) => !p.isOnline).toList();

  Future<void> loadPrinters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.getAllPrinters();

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar impressoras';
      _isLoading = false;
    } else {
      _printers = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> loadLocalPrinters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.getLocalPrinters();

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar impressoras locais';
      _isLoading = false;
    } else {
      final printers = result.getOrThrow();
      _printers = [..._printers.where((p) => !p.isLocal), ...printers];
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> loadRemotePrinters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.getRemotePrinters();

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar impressoras remotas';
      _isLoading = false;
    } else {
      final printers = result.getOrThrow();
      _printers = [..._printers.where((p) => !p.isRemote), ...printers];
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> loadPrintersByHost(String hostId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.getPrintersByHost(hostId);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar impressoras do host';
      _isLoading = false;
    } else {
      final printers = result.getOrThrow();
      _printers = [..._printers.where((p) => p.hostId != hostId), ...printers];
      _isLoading = false;
    }

    notifyListeners();
  }

  void selectPrinter(PrinterDTO? printer) {
    _selectedPrinter = printer;
    notifyListeners();
  }

  Future<void> deletePrinter(String printerId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.deletePrinter(printerId);

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao remover impressora';
      _isLoading = false;
    } else {
      _printers.removeWhere((p) => p.id == printerId);

      if (_selectedPrinter?.id == printerId) {
        _selectedPrinter = null;
      }

      _isLoading = false;
    }

    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
