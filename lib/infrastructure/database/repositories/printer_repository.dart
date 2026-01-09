import 'package:drift/drift.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/domain.dart';
import '../../datasources/windows/spooler_datasource.dart';
import '../../datasources/windows/printer_info.dart';
import '../../datasources/windows/printer_supply_collector.dart';
import '../../grpc/client/host_discovery_client.dart';
import '../../grpc/generated/generated.dart' as pb;
import '../../../application/services/maintenance_detector_service.dart';

import '../app_database.dart';
import '../mappers/mappers.dart';

class PrinterRepository implements IPrinterRepository {
  final AppDatabase _db;
  final PrinterSupplyCollector _supplyCollector;
  final MaintenanceDetectorService? _maintenanceDetector;

  PrinterRepository(
    this._db, {
    MaintenanceDetectorService? maintenanceDetector,
  })  : _supplyCollector = PrinterSupplyCollector(),
        _maintenanceDetector = maintenanceDetector;

  @override
  Future<Result<List<Printer>>> getAll() async {
    try {
      final data = await _db.select(_db.printers).get();
      final printers = data.map(PrinterMapper.toEntity).toList();
      return Success(printers);
    } catch (e) {
      return StorageException.readFailed('printers').toFailure();
    }
  }

  @override
  Future<Result<List<Printer>>> getLocalPrinters() async {
    try {
      final data = await (_db.select(_db.printers)
            ..where((tbl) => tbl.location.equals(PrinterLocation.local.index)))
          .get();
      final printers = data.map(PrinterMapper.toEntity).toList();
      return Success(printers);
    } catch (e) {
      return StorageException.readFailed('local printers').toFailure();
    }
  }

  @override
  Future<Result<List<Printer>>> getRemotePrinters() async {
    try {
      final data = await (_db.select(_db.printers)
            ..where((tbl) => tbl.location.equals(PrinterLocation.remote.index)))
          .get();
      final printers = data.map(PrinterMapper.toEntity).toList();
      return Success(printers);
    } catch (e) {
      return StorageException.readFailed('remote printers').toFailure();
    }
  }

  @override
  Future<Result<List<Printer>>> getByHostId(String hostId) async {
    try {
      final data = await (_db.select(_db.printers)
            ..where((tbl) => tbl.hostId.equals(hostId)))
          .get();
      final printers = data.map(PrinterMapper.toEntity).toList();
      return Success(printers);
    } catch (e) {
      return StorageException.readFailed('printers from host: $hostId')
          .toFailure();
    }
  }

  @override
  Future<Result<Printer>> getById(String id) async {
    try {
      final data = await (_db.select(_db.printers)
            ..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

      if (data == null) {
        return StorageException.notFound('printer: $id').toFailure();
      }

      return Success(PrinterMapper.toEntity(data));
    } catch (e) {
      return StorageException.readFailed('printer: $id').toFailure();
    }
  }

  @override
  Future<Result<Printer>> add(Printer printer) async {
    try {
      await _db.into(_db.printers).insert(PrinterMapper.toCompanion(printer));
      return Success(printer);
    } catch (e) {
      return StorageException.writeFailed('printer: ${printer.id}').toFailure();
    }
  }

  @override
  Future<Result<Printer>> update(
    Printer printer, {
    PrinterStatusCallback? onStatusChanged,
  }) async {
    try {
      final currentResult = await getById(printer.id);

      PrinterStatus? oldStatus;
      if (currentResult.isSuccess()) {
        oldStatus = currentResult.getOrThrow().status;
      }

      await _db
          .update(_db.printers)
          .replace(PrinterMapper.toCompanion(printer));

      if (onStatusChanged != null && oldStatus != null && oldStatus != printer.status) {
        onStatusChanged(
          printer,
          oldStatus,
          printer.status,
        );
      }

      return Success(printer);
    } catch (e) {
      return StorageException.writeFailed('printer: ${printer.id}').toFailure();
    }
  }

  @override
  Future<Result<Unit>> delete(String id) async {
    try {
      await (_db.delete(_db.printers)..where((tbl) => tbl.id.equals(id))).go();
      return Success(unit);
    } catch (e) {
      return StorageException.writeFailed('printer: $id').toFailure();
    }
  }

  @override
  Future<Result<Printer>> refreshStatus(String printerId) async {
    try {
      final currentResult = await getById(printerId);
      if (currentResult.isError()) {
        return currentResult.exceptionOrNull()!.toFailure();
      }

      final current = currentResult.getOrThrow();
      final now = DateTime.now();

      if (current.isLocal) {
        final spooler = SpoolerDataSource();
        final printers = spooler.enumeratePrinters();
        final match = printers.where((p) => p.name == current.name).toList();

        if (match.isEmpty) {
          return StorageException.notFound('local printer: ${current.name}')
              .toFailure();
        }

        final info = match.first;

        final supplies = await _supplyCollector.collectSupplies(
          current.id,
          current.name,
        );
        final tonerLevel = _supplyCollector.getTonerLevelString(
          supplies.firstWhere(
            (s) => s.type == SupplyType.toner,
            orElse: () => PrinterSupply(
              id: '',
              printerId: current.id,
              type: SupplyType.toner,
              level: 100,
              unit: '%',
              lastChecked: now,
            ),
          ).level,
        );
        final paperLevel = _supplyCollector.getPaperLevelString(
          supplies.firstWhere(
            (s) => s.type == SupplyType.paper,
            orElse: () => PrinterSupply(
              id: '',
              printerId: current.id,
              type: SupplyType.paper,
              level: 100,
              unit: '%',
              lastChecked: now,
            ),
          ).level,
        );

        final updated = current.copyWith(
          status: _mapLocalStatus(info),
          jobCount: info.jobCount,
          driverName: info.driverName,
          portName: info.portName,
          locationDescription: info.location,
          comment: info.comment,
          lastSeen: now,
          tonerLevel: tonerLevel,
          paperLevel: paperLevel,
        );

        await (_db.update(_db.printers)
              ..where((tbl) => tbl.id.equals(updated.id)))
            .write(PrinterMapper.toUpdateCompanion(updated));

        await _saveSupplies(supplies);

        if (_maintenanceDetector != null) {
          await _maintenanceDetector.detectAndRecordMaintenance(
            printer: updated,
            previousPrinter: current,
            currentSupplies: supplies,
          );
        }

        if (updated.tonerLevel != current.tonerLevel ||
            updated.paperLevel != current.paperLevel) {
          final updatedWithMaintenance = updated.copyWith(
            lastMaintenanceDate: DateTime.now(),
          );
          await (_db.update(_db.printers)
                ..where((tbl) => tbl.id.equals(updatedWithMaintenance.id)))
              .write(PrinterMapper.toUpdateCompanion(updatedWithMaintenance));
          return Success(updatedWithMaintenance);
        }

        return Success(updated);
      }

      final hostId = current.hostId;
      if (hostId == null || hostId.isEmpty) {
        return StorageException.readFailed('remote printer hostId missing')
            .toFailure();
      }

      final hostData = await (_db.select(_db.hosts)
            ..where((tbl) => tbl.id.equals(hostId)))
          .getSingleOrNull();

      if (hostData == null) {
        return StorageException.notFound('host: $hostId').toFailure();
      }

      final host = HostMapper.toEntity(hostData);

      if (!host.isOnline) {
        return NetworkException.hostOffline(host.name).toFailure();
      }

      final config = HostDiscoveryConfig(
        hostAddress: host.address.host,
        hostPort: host.address.port,
      );
      final client = HostDiscoveryClient(config: config, clientId: 'magic_printer');

      try {
        final tokenValue = host.token?.value ?? '';
        final response = await client.listPrinters(tokenValue);

        if (!response.success) {
          return Failure(
            AuthException(
              response.errorCode.isEmpty
                  ? 'E_AUTH_INVALID_TOKEN'
                  : response.errorCode,
              response.errorMessage.isEmpty
                  ? 'Falha ao listar impressoras'
                  : response.errorMessage,
            ),
          );
        }

        final remoteMatch = response.printers
            .where((p) => p.name == current.name)
            .toList();

        if (remoteMatch.isEmpty) {
          return StorageException.notFound('remote printer: ${current.name}')
              .toFailure();
        }

        final p = remoteMatch.first;
        final updated = current.copyWith(
          status: _mapPrinterStatus(p.status),
          driverName: p.driverName.isEmpty ? null : p.driverName,
          portName: p.portName.isEmpty ? null : p.portName,
          locationDescription: p.location.isEmpty ? null : p.location,
          comment: p.comment.isEmpty ? null : p.comment,
          jobCount: p.jobCount,
          shared: p.shared,
          allowedGroups: p.allowedGroups,
          lastSeen: now,
        );

        await (_db.update(_db.printers)
              ..where((tbl) => tbl.id.equals(updated.id)))
            .write(PrinterMapper.toUpdateCompanion(updated));

        return Success(updated);
      } finally {
        await client.close();
      }
    } catch (e) {
      return Failure(NetworkException('E_REFRESH_STATUS_FAILED', e.toString()));
    }
  }

  PrinterStatus _mapLocalStatus(PrinterInfoData info) {
    if (info.hasError) return PrinterStatus.error;
    if (info.isPaused) return PrinterStatus.paused;
    if (info.isPrinting) return PrinterStatus.printing;
    if (info.isOffline) return PrinterStatus.offline;
    return PrinterStatus.online;
  }

  @override
  Future<Result<List<Printer>>> refreshAllFromHost(String hostId) async {
    try {
      final hostData = await (_db.select(_db.hosts)
            ..where((tbl) => tbl.id.equals(hostId)))
          .getSingleOrNull();

      if (hostData == null) {
        return StorageException.notFound('host: $hostId').toFailure();
      }

      final host = HostMapper.toEntity(hostData);

      if (!host.isOnline) {
        return NetworkException.hostOffline(host.name).toFailure();
      }

      final config = HostDiscoveryConfig(
        hostAddress: host.address.host,
        hostPort: host.address.port,
      );
      final client = HostDiscoveryClient(
        config: config,
        clientId: 'magic_printer',
      );

      try {
        final tokenValue = host.token?.value ?? '';
        final response = await client.listPrinters(tokenValue);
        if (!response.success) {
          return Failure(
            AuthException(
              response.errorCode.isEmpty
                  ? 'E_AUTH_INVALID_TOKEN'
                  : response.errorCode,
              response.errorMessage.isEmpty
                  ? 'Falha ao listar impressoras'
                  : response.errorMessage,
            ),
          );
        }

        final now = DateTime.now();
        final printers = response.printers.map((p) {
          return Printer(
            id: '$hostId:${p.name}',
            name: p.name,
            hostId: hostId,
            location: PrinterLocation.remote,
            status: _mapPrinterStatus(p.status),
            driverName: p.driverName.isEmpty ? null : p.driverName,
            portName: p.portName.isEmpty ? null : p.portName,
            locationDescription: p.location.isEmpty ? null : p.location,
            comment: p.comment.isEmpty ? null : p.comment,
            jobCount: p.jobCount,
            shared: p.shared,
            allowedGroups: p.allowedGroups,
            lastSeen: now,
          );
        }).toList();

        await _db.batch((batch) {
          for (final printer in printers) {
            batch.insert(
              _db.printers,
              PrinterMapper.toCompanion(printer),
              mode: InsertMode.insertOrReplace,
            );
          }
        });

        return Success(printers);
      } finally {
        await client.close();
      }
    } catch (e) {
      return Failure(NetworkException('E_GRPC_ERROR', e.toString()));
    }
  }

  PrinterStatus _mapPrinterStatus(pb.PrinterStatus status) {
    switch (status) {
      case pb.PrinterStatus.PRINTER_STATUS_ONLINE:
        return PrinterStatus.online;
      case pb.PrinterStatus.PRINTER_STATUS_OFFLINE:
        return PrinterStatus.offline;
      case pb.PrinterStatus.PRINTER_STATUS_ERROR:
        return PrinterStatus.error;
      case pb.PrinterStatus.PRINTER_STATUS_PAUSED:
        return PrinterStatus.paused;
      case pb.PrinterStatus.PRINTER_STATUS_PRINTING:
        return PrinterStatus.printing;
      case pb.PrinterStatus.PRINTER_STATUS_UNKNOWN:
        return PrinterStatus.unknown;
      default:
        return PrinterStatus.unknown;
    }
  }

  Future<void> _saveSupplies(List<PrinterSupply> supplies) async {
    if (supplies.isEmpty) return;

    try {
      final existingSupplies = await (_db.select(_db.printerSupplies)
            ..where((tbl) => tbl.printerId.equals(supplies.first.printerId)))
          .get();

      final existingIds = existingSupplies.map((s) => s.id).toSet();

      for (final supply in supplies) {
        if (existingIds.contains(supply.id)) {
          await (_db.update(_db.printerSupplies)
                ..where((tbl) => tbl.id.equals(supply.id)))
              .write(PrinterSupplyMapper.toUpdateCompanion(supply));
        } else {
          await _db
              .into(_db.printerSupplies)
              .insert(PrinterSupplyMapper.toCompanion(supply));
        }
      }
    } catch (e) {
      // Ignore errors during supply save
    }
  }
}

