import 'package:drift/drift.dart';

class Jadwal extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get waktuNama => text().named('user_name')();
  TextColumn get alarmMode => text().named('user_name')();
  TextColumn get waktuSholat => text().named('user_name')();
  DateTimeColumn get tanggalSholat => dateTime().named('date_of_sholat')();
}
