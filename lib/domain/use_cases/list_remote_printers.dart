import 'package:result_dart/result_dart.dart';

import '../entities/printer.dart';
import '../errors/failures.dart';
import '../repositories/i_host_repository.dart';
import '../repositories/i_printer_repository.dart';

class ListRemotePrinters {
  final IHostRepository _hostRepository;
  final IPrinterRepository _printerRepository;

  ListRemotePrinters({
    required IHostRepository hostRepository,
    required IPrinterRepository printerRepository,
  })  : _hostRepository = hostRepository,
        _printerRepository = printerRepository;

  Future<Result<List<Printer>>> call() async {
    return _printerRepository.getRemotePrinters();
  }

  Future<Result<List<Printer>>> fromHost(String hostId) async {
    final hostResult = await _hostRepository.getById(hostId);

    if (hostResult.isError()) {
      return hostResult.exceptionOrNull()!.toFailure();
    }

    final host = hostResult.getOrThrow();

    if (!host.isOnline) {
      return NetworkException.hostOffline(host.name).toFailure();
    }

    return _printerRepository.getByHostId(hostId);
  }

  Future<Result<List<Printer>>> refreshFromHost(String hostId) async {
    final hostResult = await _hostRepository.getById(hostId);

    if (hostResult.isError()) {
      return hostResult.exceptionOrNull()!.toFailure();
    }

    final host = hostResult.getOrThrow();

    if (!host.isOnline) {
      return NetworkException.hostOffline(host.name).toFailure();
    }

    return _printerRepository.refreshAllFromHost(hostId);
  }
}
