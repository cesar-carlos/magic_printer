import 'package:drift/drift.dart';

@DataClassName('UserData')
class Users extends Table {
  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get displayName => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get groupIds => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get lastSeen => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
