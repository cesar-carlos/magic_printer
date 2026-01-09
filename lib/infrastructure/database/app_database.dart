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
    PrinterHealthTable,
    AlertRulesTable,
    PredictionsTable,
    PatternsTable,
    ActionRulesTable,
    AutomatedActionsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 7;

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
      if (from <= 3 && to == 4) {
        await m.createTable(printerHealthTable);
        await m.createIndex(Index(
          'printer_health_printer_id_idx',
          'CREATE INDEX printer_health_printer_id_idx ON printer_health_table(printer_id)',
        ));
        await m.createIndex(Index(
          'printer_health_last_check_idx',
          'CREATE INDEX printer_health_last_check_idx ON printer_health_table(last_check)',
        ));
      }
      if (from <= 4 && to == 5) {
        await m.createTable(alertRulesTable);
        await m.createIndex(Index(
          'alert_rules_type_idx',
          'CREATE INDEX alert_rules_type_idx ON alert_rules_table(type)',
        ));
        await m.createIndex(Index(
          'alert_rules_enabled_idx',
          'CREATE INDEX alert_rules_enabled_idx ON alert_rules_table(enabled)',
        ));
      }
      if (from <= 5 && to == 6) {
        await m.createTable(predictionsTable);
        await m.createTable(patternsTable);
        await m.createIndex(Index(
          'predictions_printer_id_idx',
          'CREATE INDEX predictions_printer_id_idx ON predictions_table(printer_id)',
        ));
        await m.createIndex(Index(
          'patterns_printer_id_idx',
          'CREATE INDEX patterns_printer_id_idx ON patterns_table(printer_id)',
        ));
      }
      if (from <= 6 && to == 7) {
        await m.createTable(actionRulesTable);
        await m.createTable(automatedActionsTable);
        await m.createIndex(Index(
          'action_rules_enabled_idx',
          'CREATE INDEX action_rules_enabled_idx ON action_rules_table(enabled)',
        ));
        await m.createIndex(Index(
          'automated_actions_printer_id_idx',
          'CREATE INDEX automated_actions_printer_id_idx ON automated_actions_table(printer_id)',
        ));
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
