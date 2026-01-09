import 'package:result_dart/result_dart.dart';

import '../entities/printer_supply.dart';

abstract class IPrinterSupplyRepository {
  Future<Result<List<PrinterSupply>>> getAll();

  Future<Result<List<PrinterSupply>>> getByPrinterId(String printerId);

  Future<Result<PrinterSupply>> getById(String id);

  Future<Result<PrinterSupply>> create(PrinterSupply supply);

  Future<Result<PrinterSupply>> update(PrinterSupply supply);

  Future<Result<Unit>> delete(String id);

  Future<Result<List<PrinterSupply>>> getLowSupplies({int threshold = 20});

  Future<Result<List<PrinterSupply>>> getCriticalSupplies({int threshold = 10});
}
