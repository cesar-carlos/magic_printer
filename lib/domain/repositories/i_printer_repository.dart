import 'package:result_dart/result_dart.dart';

import '../entities/printer.dart';

abstract class IPrinterRepository {
  Future<Result<List<Printer>>> getAll();

  Future<Result<List<Printer>>> getLocalPrinters();

  Future<Result<List<Printer>>> getRemotePrinters();

  Future<Result<List<Printer>>> getByHostId(String hostId);

  Future<Result<Printer>> getById(String id);

  Future<Result<Printer>> add(Printer printer);

  Future<Result<Printer>> update(Printer printer);

  Future<Result<Unit>> delete(String id);

  Future<Result<Printer>> refreshStatus(String printerId);

  Future<Result<List<Printer>>> refreshAllFromHost(String hostId);
}
