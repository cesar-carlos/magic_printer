import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Hosts, Printers, Jobs, Groups, Logs, EmailConfigs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

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
