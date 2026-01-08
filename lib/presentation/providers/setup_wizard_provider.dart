import 'package:flutter/foundation.dart';

import '../../application/application.dart';
import '../../domain/domain.dart';
import 'safe_notifier_mixin.dart';

enum SetupWizardStep { hostInfo, selectPrinter, configurePrinter, test }

class SetupWizardProvider extends ChangeNotifier with SafeNotifierMixin {
  final HostService _hostService;
  final PrinterService _printerService;
  final PrintForwardingService _forwardingService;

  SetupWizardProvider({
    required HostService hostService,
    required PrinterService printerService,
    required PrintForwardingService forwardingService,
  }) : _hostService = hostService,
       _printerService = printerService,
       _forwardingService = forwardingService;

  SetupWizardStep _currentStep = SetupWizardStep.hostInfo;
  bool _isLoading = false;
  String? _error;

  String? _hostName;
  String? _hostAddress;
  int? _hostPort;
  HostDTO? _connectedHost;
  List<PrinterDTO> _availablePrinters = [];
  PrinterDTO? _selectedPrinter;
  String? _printerName;
  String? _printerAlias; // Apelido para a impressora remota
  String? _printerDescription; // Descrição da impressora
  bool _testPassed = false;

  SetupWizardStep get currentStep => _currentStep;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get hostName => _hostName;
  String? get hostAddress => _hostAddress;
  int? get hostPort => _hostPort;
  HostDTO? get connectedHost => _connectedHost;
  List<PrinterDTO> get availablePrinters => _availablePrinters;
  PrinterDTO? get selectedPrinter => _selectedPrinter;
  String? get printerName => _printerName;
  String? get printerAlias => _printerAlias;
  String? get printerDescription => _printerDescription;
  bool get testPassed => _testPassed;

  bool get canGoNext {
    switch (_currentStep) {
      case SetupWizardStep.hostInfo:
        return _connectedHost != null;
      case SetupWizardStep.selectPrinter:
        return _selectedPrinter != null;
      case SetupWizardStep.configurePrinter:
        return _printerName != null &&
            _printerName!.isNotEmpty &&
            _printerAlias != null &&
            _printerAlias!.isNotEmpty;
      case SetupWizardStep.test:
        return _testPassed;
    }
  }

  bool get canGoBack => _currentStep != SetupWizardStep.hostInfo;

  void setHostInfo({String? name, String? address, int? port}) {
    if (name != null) {
      _hostName = name;
    }
    if (address != null) {
      _hostAddress = address;
    }
    if (port != null) {
      _hostPort = port;
    }
    notifyListeners();
  }

  Future<void> connectToHost() async {
    // Validar campos obrigatórios
    final hostAddress = _hostAddress?.trim();
    final hostPort = _hostPort;

    if (hostAddress == null || hostAddress.isEmpty || hostPort == null || hostPort <= 0) {
      _error = 'Endereço e porta são obrigatórios';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    // Primeiro, verificar se o host já existe
    final address = HostAddress(host: hostAddress, port: hostPort);
    final existingHostResult = await _hostService.getHostByAddress(address);

    String hostId;

    if (existingHostResult.isSuccess()) {
      // Host já existe, usar o existente
      hostId = existingHostResult.getOrThrow().id;
    } else {
      // Host não existe, adicionar novo
      final request = AddHostRequestDTO(
        name: _hostName ?? hostAddress,
        host: hostAddress,
        port: hostPort,
      );

      final addResult = await _hostService.addHost(request);

      if (addResult.isError()) {
        final exception = addResult.exceptionOrNull();
        _error = exception?.toString() ?? 'Erro ao adicionar host';
        _isLoading = false;
        notifyListeners();
        return;
      }

      hostId = addResult.getOrThrow().id;
    }

    // Conectar ao host (existente ou novo)
    final connectRequest = ConnectHostRequestDTO(
      hostId: hostId,
    );

    final connectResult = await _hostService.connectHost(connectRequest);

    if (connectResult.isError()) {
      final exception = connectResult.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao conectar ao host';
      _isLoading = false;
    } else {
      _connectedHost = connectResult.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  Future<void> loadAvailablePrinters() async {
    if (_connectedHost == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _printerService.refreshPrintersFromHost(
      _connectedHost!.id,
    );

    if (result.isError()) {
      final exception = result.exceptionOrNull();
      _error = exception?.toString() ?? 'Erro ao carregar impressoras';
      _isLoading = false;
    } else {
      _availablePrinters = result.getOrThrow();
      _isLoading = false;
    }

    notifyListeners();
  }

  void selectPrinter(PrinterDTO printer) {
    _selectedPrinter = printer;
    _printerName ??= 'Microsoft Print to PDF';
    notifyListeners();
  }

  void setPrinterName(String name) {
    _printerName = name;
    notifyListeners();
  }

  void setPrinterAlias(String alias) {
    _printerAlias = alias;
    notifyListeners();
  }

  void setPrinterDescription(String description) {
    _printerDescription = description;
    notifyListeners();
  }

  Future<void> testConnection() async {
    if (_selectedPrinter == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    final host = _connectedHost;
    if (host == null) {
      _error = 'Host não conectado';
      _isLoading = false;
      notifyListeners();
      return;
    }

    final result = await _printerService.refreshPrintersFromHost(host.id);
    if (result.isError()) {
      _error = result.exceptionOrNull()?.toString() ?? 'Falha no teste';
      _testPassed = false;
      _isLoading = false;
      notifyListeners();
      return;
    }

    _testPassed = true;
    _isLoading = false;
    notifyListeners();
  }

  void startForwarding() {
    final capturePrinterName = _printerName;
    final targetPrinter = _selectedPrinter;

    if (!_testPassed || capturePrinterName == null || targetPrinter == null) {
      return;
    }

    _forwardingService.start(
      capturePrinterName: capturePrinterName,
      targetPrinterId: targetPrinter.id,
      targetPrinterName: targetPrinter.name,
    );
  }

  void nextStep() {
    if (!canGoNext) return;

    switch (_currentStep) {
      case SetupWizardStep.hostInfo:
        _currentStep = SetupWizardStep.selectPrinter;
        loadAvailablePrinters();
        break;
      case SetupWizardStep.selectPrinter:
        _currentStep = SetupWizardStep.configurePrinter;
        break;
      case SetupWizardStep.configurePrinter:
        _currentStep = SetupWizardStep.test;
        testConnection();
        break;
      case SetupWizardStep.test:
        break;
    }

    notifyListeners();
  }

  void previousStep() {
    if (!canGoBack) return;

    switch (_currentStep) {
      case SetupWizardStep.hostInfo:
        break;
      case SetupWizardStep.selectPrinter:
        _currentStep = SetupWizardStep.hostInfo;
        break;
      case SetupWizardStep.configurePrinter:
        _currentStep = SetupWizardStep.selectPrinter;
        break;
      case SetupWizardStep.test:
        _currentStep = SetupWizardStep.configurePrinter;
        break;
    }

    notifyListeners();
  }

  void reset() {
    _currentStep = SetupWizardStep.hostInfo;
    _isLoading = false;
    _error = null;
    _hostName = null;
    _hostAddress = null;
    _hostPort = null;
    _connectedHost = null;
    _availablePrinters = [];
    _selectedPrinter = null;
    _printerName = null;
    _printerAlias = null;
    _printerDescription = null;
    _testPassed = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
