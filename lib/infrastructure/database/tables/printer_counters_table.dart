import 'package:drift/drift.dart';

@DataClassName('PrinterCounterData')
class PrinterCounters extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  IntColumn get totalPagesPrinted =>
      integer().withDefault(const Constant(0))();
  IntColumn get totalJobsProcessed =>
      integer().withDefault(const Constant(0))();
  IntColumn get totalBytesPrinted =>
      integer().withDefault(const Constant(0))();
  DateTimeColumn get lastReset => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {printerId};
}
