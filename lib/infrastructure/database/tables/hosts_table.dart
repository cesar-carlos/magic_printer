import 'package:drift/drift.dart';

@DataClassName('HostData')
class Hosts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get host => text()();
  IntColumn get port => integer()();
  IntColumn get status => integer()();
  BoolColumn get requiresAuth => boolean().withDefault(const Constant(true))();
  TextColumn get token => text().nullable()();
  DateTimeColumn get tokenExpiresAt => dateTime().nullable()();
  DateTimeColumn get lastSeen => dateTime().nullable()();
  TextColumn get supportedFeatures => text().withDefault(const Constant(''))();
  TextColumn get version => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

