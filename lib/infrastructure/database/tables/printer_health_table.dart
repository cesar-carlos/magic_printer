import 'package:drift/drift.dart';

@DataClassName('PrinterHealthData')
class PrinterHealthTable extends Table {
  TextColumn get printerId => text()();
  IntColumn get healthScore => integer()();
  RealColumn get errorRate => real()();
  RealColumn get availability => real()();
  IntColumn get avgResponseTimeMs => integer()();
  IntColumn get supplyScore => integer()();
  DateTimeColumn get lastCheck => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {printerId};
}
