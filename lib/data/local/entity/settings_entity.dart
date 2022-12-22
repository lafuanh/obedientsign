import 'package:drift/drift.dart';

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text().named('user_value')();
  TextColumn get description => text()();
}
