import 'package:drift/drift.dart';

@DataClassName('JobData')
class Jobs extends Table {
  TextColumn get id => text()();
  TextColumn get documentName => text()();
  TextColumn get printerName => text()();
  TextColumn get hostId => text().nullable()();
  IntColumn get status => integer()();
  IntColumn get totalSize => integer().withDefault(const Constant(0))();
  IntColumn get sentBytes => integer().withDefault(const Constant(0))();
  IntColumn get totalChunks => integer().withDefault(const Constant(0))();
  IntColumn get sentChunks => integer().withDefault(const Constant(0))();
  IntColumn get totalPages => integer().withDefault(const Constant(0))();
  IntColumn get printedPages => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get startedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  TextColumn get errorCode => text().nullable()();
  TextColumn get errorMessage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

