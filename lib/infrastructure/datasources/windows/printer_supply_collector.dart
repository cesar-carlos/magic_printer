import '../../../domain/domain.dart';
import 'spooler_constants.dart';
import 'spooler_datasource.dart';

class PrinterSupplyCollector {
  final SpoolerDataSource _dataSource;

  PrinterSupplyCollector({SpoolerDataSource? dataSource})
      : _dataSource = dataSource ?? SpoolerDataSource();

  Future<List<PrinterSupply>> collectSupplies(String printerId, String printerName) async {
    final supplies = <PrinterSupply>[];
    final now = DateTime.now();

    try {
      final hPrinter = _dataSource.openPrinter(printerName);
      if (hPrinter == null) {
        return supplies;
      }

      try {
        final printers = _dataSource.enumeratePrinters();
        final printerInfo = printers.firstWhere(
          (p) => p.name == printerName,
          orElse: () => throw Exception('Printer not found'),
        );

        final tonerLevel = _getTonerLevelFromStatus(printerInfo.status);
        if (tonerLevel != null) {
          final supply = PrinterSupply(
            id: '$printerId:toner',
            printerId: printerId,
            type: SupplyType.toner,
            level: tonerLevel,
            unit: '%',
            lastChecked: now,
          );
          supplies.add(supply);
        }

        final paperLevel = _getPaperLevelFromStatus(printerInfo.status);
        if (paperLevel != null) {
          final supply = PrinterSupply(
            id: '$printerId:paper',
            printerId: printerId,
            type: SupplyType.paper,
            level: paperLevel,
            unit: '%',
            lastChecked: now,
          );
          supplies.add(supply);
        }
      } finally {
        _dataSource.closePrinter(hPrinter);
      }
    } catch (e) {
      // Ignore errors during supply collection
    }

    return supplies;
  }

  int? _getTonerLevelFromStatus(int status) {
    if ((status & printerStatusNoToner) != 0) {
      return 0;
    }
    if ((status & printerStatusTonerLow) != 0) {
      return 15;
    }
    return null;
  }

  int? _getPaperLevelFromStatus(int status) {
    if ((status & printerStatusPaperOut) != 0) {
      return 0;
    }
    if ((status & printerStatusPaperProblem) != 0) {
      return 20;
    }
    return null;
  }

  String? getTonerLevelString(int? level) {
    if (level == null) return null;
    if (level == 0) return 'empty';
    if (level <= 15) return 'low';
    if (level <= 50) return 'medium';
    return 'high';
  }

  String? getPaperLevelString(int? level) {
    if (level == null) return null;
    if (level == 0) return 'empty';
    if (level <= 20) return 'low';
    if (level <= 50) return 'medium';
    return 'high';
  }
}
