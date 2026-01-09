import 'package:drift/drift.dart';

@DataClassName('AutomatedActionData')
class AutomatedActionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get ruleId => text()();
  TextColumn get printerId => text()();
  IntColumn get actionType => integer()();
  TextColumn get parameters => text()();
  IntColumn get result => integer()();
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get executedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
