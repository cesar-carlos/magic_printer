import 'package:drift/drift.dart';

@DataClassName('PrinterData')
class Printers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get hostId => text().nullable()();
  IntColumn get location => integer()();
  IntColumn get status => integer()();
  TextColumn get driverName => text().nullable()();
  TextColumn get portName => text().nullable()();
  TextColumn get locationDescription => text().nullable()();
  TextColumn get comment => text().nullable()();
  IntColumn get jobCount => integer().withDefault(const Constant(0))();
  BoolColumn get shared => boolean().withDefault(const Constant(true))();
  TextColumn get allowedGroups => text().withDefault(const Constant(''))();
  DateTimeColumn get lastSeen => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

