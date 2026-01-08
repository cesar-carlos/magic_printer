import 'package:drift/drift.dart';

@DataClassName('EmailConfigEntry')
class EmailConfigs extends Table {
  TextColumn get id => text()();
  TextColumn get smtpHost => text()();
  IntColumn get smtpPort => integer()();
  BoolColumn get useSsl => boolean().withDefault(const Constant(true))();
  TextColumn get username => text()();
  TextColumn get password => text()();
  TextColumn get fromEmail => text()();
  TextColumn get toEmail => text()();
  BoolColumn get enabled => boolean().withDefault(const Constant(false))();
  BoolColumn get notifyOnPrintFailure =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get notifyOnPrinterOffline =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get notifyOnJobStuck =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get notifyOnAuthFailure =>
      boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
