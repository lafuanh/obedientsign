import 'package:drift/drift.dart';

class Settings extends Table {
  TextColumn get value => text().named('settings_value')();
  TextColumn get name => text()();
}
