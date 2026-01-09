import 'package:drift/drift.dart';

@DataClassName('PrinterMaintenanceData')
class PrinterMaintenances extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  TextColumn get maintenanceType => text()();
  TextColumn get description => text().nullable()();
  TextColumn get performedBy => text().nullable()();
  DateTimeColumn get performedAt => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
