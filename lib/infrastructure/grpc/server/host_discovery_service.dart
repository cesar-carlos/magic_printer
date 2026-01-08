import 'package:grpc/grpc.dart' as grpc;
import 'package:logger/logger.dart';

import '../../../core/constants/app_constants.dart';
import '../generated/generated.dart' as pb;
import '../../datasources/windows/windows.dart';
import 'i_grpc_auth_service.dart';

class HostDiscoveryServiceImpl extends pb.HostDiscoveryServiceBase {
  final SpoolerDataSource _spoolerDataSource;
  final IGrpcAuthService? _authService;
  final Logger _logger;

  final String hostId;
  final String hostName;
  final int port;
  final bool requiresAuth;
  final List<String> supportedFeatures;

  HostDiscoveryServiceImpl({
    required this.hostId,
    required this.hostName,
    required this.port,
    this.requiresAuth = true,
    this.supportedFeatures = const ['chunking', 'compression', 'retry'],
    SpoolerDataSource? spoolerDataSource,
    IGrpcAuthService? authService,
    Logger? logger,
  })  : _spoolerDataSource = spoolerDataSource ?? SpoolerDataSource(),
        _authService = authService,
        _logger = logger ?? Logger();

  @override
  Future<pb.GetHostInfoResponse> getHostInfo(
    grpc.ServiceCall call,
    pb.GetHostInfoRequest request,
  ) async {
    _logger.d('GetHostInfo de client: ${request.clientId}');

    return pb.GetHostInfoResponse()
      ..hostId = hostId
      ..hostName = hostName
      ..version = appVersion
      ..port = port
      ..requiresAuth = requiresAuth
      ..supportedFeatures.addAll(supportedFeatures);
  }

  @override
  Future<pb.ListPrintersResponse> listPrinters(
    grpc.ServiceCall call,
    pb.ListPrintersRequest request,
  ) async {
    _logger.d('ListPrinters solicitado');

    if (_authService != null &&
        !_authService.validateToken(request.authToken)) {
      return pb.ListPrintersResponse()
        ..success = false
        ..errorCode = 'E_AUTH_INVALID_TOKEN'
        ..errorMessage = 'Token inválido ou expirado';
    }

    final printers = _spoolerDataSource.enumeratePrinters();

    final printerDtos = printers.map((p) {
      return pb.PrinterInfo()
        ..name = p.name
        ..driverName = p.driverName ?? ''
        ..portName = p.portName ?? ''
        ..location = p.location ?? ''
        ..comment = p.comment ?? ''
        ..status = _mapPrinterStatus(p)
        ..jobCount = p.jobCount
        ..shared = true;
    }).toList();

    _logger.i('Listando ${printerDtos.length} impressoras');

    return pb.ListPrintersResponse()
      ..success = true
      ..printers.addAll(printerDtos);
  }

  @override
  Future<pb.CheckPermissionResponse> checkPermission(
    grpc.ServiceCall call,
    pb.CheckPermissionRequest request,
  ) async {
    _logger.d(
      'CheckPermission: ${request.printerName} - ${request.permission}',
    );

    if (_authService == null) {
      return pb.CheckPermissionResponse()..allowed = true;
    }

    if (!_authService.validateToken(request.authToken)) {
      return pb.CheckPermissionResponse()
        ..allowed = false
        ..errorCode = 'E_AUTH_INVALID_TOKEN'
        ..errorMessage = 'Token inválido';
    }

    if (!_authService.checkPermission(
      request.authToken,
      request.printerName,
      request.permission,
    )) {
      return pb.CheckPermissionResponse()
        ..allowed = false
        ..errorCode = 'E_PERMISSION_DENIED'
        ..errorMessage =
            'Sem permissão para ${request.permission} em ${request.printerName}';
    }

    return pb.CheckPermissionResponse()..allowed = true;
  }

  pb.PrinterStatus _mapPrinterStatus(PrinterInfoData printer) {
    if (printer.isOffline) return pb.PrinterStatus.PRINTER_STATUS_OFFLINE;
    if (printer.hasError) return pb.PrinterStatus.PRINTER_STATUS_ERROR;
    if (printer.isPaused) return pb.PrinterStatus.PRINTER_STATUS_PAUSED;
    if (printer.isPrinting) return pb.PrinterStatus.PRINTER_STATUS_PRINTING;
    return pb.PrinterStatus.PRINTER_STATUS_ONLINE;
  }
}
