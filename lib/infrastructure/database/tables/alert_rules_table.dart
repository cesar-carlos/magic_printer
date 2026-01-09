import 'package:drift/drift.dart';

@DataClassName('AlertRuleData')
class AlertRulesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get type => integer()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get severity => integer()();
  TextColumn get thresholds => text()();
  TextColumn get actions => text()();
  IntColumn get suppressionTimeMinutes => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
