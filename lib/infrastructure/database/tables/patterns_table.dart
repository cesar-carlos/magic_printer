import 'package:drift/drift.dart';

@DataClassName('PatternData')
class PatternsTable extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  IntColumn get patternType => integer()();
  TextColumn get description => text()();
  IntColumn get occurrenceCount => integer()();
  DateTimeColumn get lastOccurrence => dateTime()();
  RealColumn get confidence => real()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
