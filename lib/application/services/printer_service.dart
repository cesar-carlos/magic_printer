import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../dtos/printer_dto.dart';
import '../mappers/printer_mapper.dart';

class PrinterService {
  final ListRemotePrinters _listRemotePrinters;
  final IPrinterRepository _printerRepository;

  PrinterService({
    required ListRemotePrinters listRemotePrinters,
    required IPrinterRepository printerRepository,
  })  : _listRemotePrinters = listRemotePrinters,
        _printerRepository = printerRepository;

  Future<Result<List<PrinterDTO>>> getAllPrinters() async {
    final result = await _printerRepository.getAll();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrinterDTO>>> getLocalPrinters() async {
    final result = await _printerRepository.getLocalPrinters();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrinterDTO>>> getRemotePrinters() async {
    final result = await _listRemotePrinters.call();

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrinterDTO>>> getPrintersByHost(String hostId) async {
    final result = await _listRemotePrinters.fromHost(hostId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<List<PrinterDTO>>> refreshPrintersFromHost(String hostId) async {
    final result = await _listRemotePrinters.refreshFromHost(hostId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTOList(result.getOrThrow()));
  }

  Future<Result<PrinterDTO>> getPrinterById(String printerId) async {
    final result = await _printerRepository.getById(printerId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return Success(PrinterMapper.toDTO(result.getOrThrow()));
  }

  Future<Result<Unit>> deletePrinter(String printerId) async {
    final result = await _printerRepository.delete(printerId);

    if (result.isError()) {
      return Failure(result.exceptionOrNull()!);
    }

    return const Success(unit);
  }
}

