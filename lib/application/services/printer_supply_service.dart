import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

class PrinterSupplyService {
  final IPrinterSupplyRepository _supplyRepository;

  PrinterSupplyService({
    required IPrinterSupplyRepository supplyRepository,
  }) : _supplyRepository = supplyRepository;

  Future<Result<List<PrinterSupply>>> getAllSupplies() async {
    return await _supplyRepository.getAll();
  }

  Future<Result<List<PrinterSupply>>> getSuppliesByPrinter(
    String printerId,
  ) async {
    return await _supplyRepository.getByPrinterId(printerId);
  }

  Future<Result<PrinterSupply>> getSupplyById(String id) async {
    return await _supplyRepository.getById(id);
  }

  Future<Result<PrinterSupply>> createSupply({
    required String printerId,
    required SupplyType type,
    required int level,
    required String unit,
  }) async {
    const uuid = Uuid();
    final supply = PrinterSupply(
      id: uuid.v4(),
      printerId: printerId,
      type: type,
      level: level,
      unit: unit,
      lastChecked: DateTime.now(),
    );

    return await _supplyRepository.create(supply);
  }

  Future<Result<PrinterSupply>> updateSupply(PrinterSupply supply) async {
    final updated = supply.copyWith(lastChecked: DateTime.now());
    return await _supplyRepository.update(updated);
  }

  Future<Result<Unit>> deleteSupply(String id) async {
    return await _supplyRepository.delete(id);
  }

  Future<Result<List<PrinterSupply>>> getLowSupplies({
    int threshold = 20,
  }) async {
    return await _supplyRepository.getLowSupplies(threshold: threshold);
  }

  Future<Result<List<PrinterSupply>>> getCriticalSupplies({
    int threshold = 10,
  }) async {
    return await _supplyRepository.getCriticalSupplies(threshold: threshold);
  }
}
