import 'package:drift/drift.dart';

@DataClassName('GroupData')
class Groups extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get permissions => text().withDefault(const Constant(''))();
  TextColumn get memberIds => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

