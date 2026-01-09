import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Hosts,
    Printers,
    Jobs,
    Groups,
    Logs,
    EmailConfigs,
    Users,
    PrinterSupplies,
    PrinterMaintenances,
    PrinterCounters,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1 && to == 2) {
        await m.createTable(logs);
        await m.createTable(emailConfigs);
        await m.createIndex(Index(
          'logs_level_idx',
          'CREATE INDEX logs_level_idx ON logs(level)',
        ));
        await m.createIndex(Index(
          'logs_category_idx',
          'CREATE INDEX logs_category_idx ON logs(category)',
        ));
        await m.createIndex(Index(
          'logs_created_at_idx',
          'CREATE INDEX logs_created_at_idx ON logs(created_at)',
        ));
      }
      if (from <= 2 && to == 3) {
        await m.createTable(users);
        await m.createTable(printerSupplies);
        await m.createTable(printerMaintenances);
        await m.createTable(printerCounters);
        
        await m.addColumn(jobs, jobs.userId);
        await m.addColumn(jobs, jobs.username);
        await m.addColumn(jobs, jobs.documentType);
        await m.addColumn(jobs, jobs.department);
        await m.addColumn(jobs, jobs.estimatedCost);
        
        await m.addColumn(printers, printers.totalPagesPrinted);
        await m.addColumn(printers, printers.tonerLevel);
        await m.addColumn(printers, printers.paperLevel);
        await m.addColumn(printers, printers.lastMaintenanceDate);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'magic_printer.db'));
    return NativeDatabase(file);
  });
}
