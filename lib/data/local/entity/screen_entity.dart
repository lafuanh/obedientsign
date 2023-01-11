import 'package:drift/drift.dart';

class Screen extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  BoolColumn get switchNotif => boolean().withDefault(const Constant(false))();
  TextColumn get timeClock => text()();
  TextColumn get status => text().nullable()();

  IntColumn get jadwalId => integer()();
}
