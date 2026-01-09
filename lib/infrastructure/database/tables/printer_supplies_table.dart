import 'package:drift/drift.dart';

@DataClassName('PrinterSupplyData')
class PrinterSupplies extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  TextColumn get supplyType => text()();
  IntColumn get level => integer()();
  TextColumn get unit => text()();
  DateTimeColumn get lastChecked => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
