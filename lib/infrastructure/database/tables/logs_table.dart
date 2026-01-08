import 'package:drift/drift.dart';

@DataClassName('LogEntry')
class Logs extends Table {
  TextColumn get id => text()();
  IntColumn get level => integer()();
  IntColumn get category => integer()();
  TextColumn get title => text()();
  TextColumn get message => text()();
  TextColumn get details => text().nullable()();
  TextColumn get printerId => text().nullable()();
  TextColumn get hostId => text().nullable()();
  TextColumn get jobId => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
