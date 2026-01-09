import 'package:result_dart/result_dart.dart';
import 'package:uuid/uuid.dart';

import '../../core/utils/windows_user_service.dart';
import '../../domain/domain.dart';

class MaintenanceDetectorService {
  final IPrinterMaintenanceRepository _maintenanceRepository;
  final IPrinterSupplyRepository _supplyRepository;
  final IUserService? _userService;

  MaintenanceDetectorService({
    required IPrinterMaintenanceRepository maintenanceRepository,
    required IPrinterSupplyRepository supplyRepository,
    IUserService? userService,
  })  : _maintenanceRepository = maintenanceRepository,
        _supplyRepository = supplyRepository,
        _userService = userService;

  Future<Result<Unit>> detectAndRecordMaintenance({
    required Printer printer,
    required Printer? previousPrinter,
    required List<PrinterSupply> currentSupplies,
  }) async {
    try {
      final maintenances = <PrinterMaintenance>[];

      if (previousPrinter != null) {
        final previousSuppliesResult = await _supplyRepository.getByPrinterId(printer.id);
        if (previousSuppliesResult.isSuccess()) {
          final previousSupplies = previousSuppliesResult.getOrThrow();

          for (final currentSupply in currentSupplies) {
            final previousSupply = previousSupplies.firstWhere(
              (s) => s.type == currentSupply.type,
              orElse: () => currentSupply,
            );

            if (_isSupplyReplenished(previousSupply, currentSupply)) {
              final maintenance = await _createSupplyMaintenance(
                printer: printer,
                supplyType: currentSupply.type,
                previousLevel: previousSupply.level,
                currentLevel: currentSupply.level,
              );
              if (maintenance != null) {
                maintenances.add(maintenance);
              }
            }
          }

          if (_isPrinterRecoveredFromError(previousPrinter, printer)) {
            final maintenance = await _createRepairMaintenance(
              printer: printer,
              previousStatus: previousPrinter.status,
            );
            if (maintenance != null) {
              maintenances.add(maintenance);
            }
          }
        }
      }

      for (final maintenance in maintenances) {
        await _maintenanceRepository.create(maintenance);
      }

      return const Success(unit);
    } catch (e) {
      return Failure(
        StorageException('E_MAINTENANCE_DETECTION_FAILED', 'Erro ao detectar manutenções: ${e.toString()}'),
      );
    }
  }

  bool _isSupplyReplenished(PrinterSupply previous, PrinterSupply current) {
    if (previous.type != current.type) return false;

    final wasLow = previous.isLow || previous.isCritical;
    final isNowHigh = current.level > 50;

    return wasLow && isNowHigh;
  }

  bool _isPrinterRecoveredFromError(Printer previous, Printer current) {
    return previous.status == PrinterStatus.error &&
        current.status == PrinterStatus.online;
  }

  Future<PrinterMaintenance?> _createSupplyMaintenance({
    required Printer printer,
    required SupplyType supplyType,
    required int previousLevel,
    required int currentLevel,
  }) async {
    MaintenanceType maintenanceType;
    String description;

    switch (supplyType) {
      case SupplyType.toner:
        maintenanceType = MaintenanceType.tonerChange;
        description = 'Toner trocado (de $previousLevel% para $currentLevel%)';
        break;
      case SupplyType.ink:
        maintenanceType = MaintenanceType.inkChange;
        description = 'Tinta trocada (de $previousLevel% para $currentLevel%)';
        break;
      case SupplyType.paper:
        maintenanceType = MaintenanceType.paperRefill;
        description = 'Papel reabastecido (de $previousLevel% para $currentLevel%)';
        break;
      default:
        maintenanceType = MaintenanceType.other;
        description = 'Suprimento ${supplyType.name} reabastecido (de $previousLevel% para $currentLevel%)';
    }

    String? performedBy;
    if (_userService != null) {
      final userResult = await _userService.getCurrentUser();
      if (userResult.isSuccess()) {
        final user = userResult.getOrThrow();
        performedBy = user.username;
      }
    }

    performedBy ??= WindowsUserService.getCurrentUsername() ?? 'System';

    return PrinterMaintenance(
      id: const Uuid().v4(),
      printerId: printer.id,
      type: maintenanceType,
      description: description,
      performedBy: performedBy,
      performedAt: DateTime.now(),
      notes: 'Detectado automaticamente pelo sistema',
    );
  }

  Future<PrinterMaintenance?> _createRepairMaintenance({
    required Printer printer,
    required PrinterStatus previousStatus,
  }) async {
    String? performedBy;
    if (_userService != null) {
      final userResult = await _userService.getCurrentUser();
      if (userResult.isSuccess()) {
        final user = userResult.getOrThrow();
        performedBy = user.username;
      }
    }

    performedBy ??= WindowsUserService.getCurrentUsername() ?? 'System';

    return PrinterMaintenance(
      id: const Uuid().v4(),
      printerId: printer.id,
      type: MaintenanceType.repair,
      description: 'Impressora recuperada de erro (status: ${previousStatus.name} → online)',
      performedBy: performedBy,
      performedAt: DateTime.now(),
      notes: 'Detectado automaticamente pelo sistema',
    );
  }
}
