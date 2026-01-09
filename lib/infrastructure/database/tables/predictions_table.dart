import 'package:drift/drift.dart';

@DataClassName('PredictionData')
class PredictionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get printerId => text()();
  IntColumn get type => integer()();
  DateTimeColumn get predictedDate => dateTime()();
  RealColumn get confidence => real()();
  TextColumn get factors => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get status => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
