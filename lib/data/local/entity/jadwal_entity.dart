import 'package:drift/drift.dart';

class Jadwal extends Table {
  IntColumn get tanggalasId => integer().autoIncrement()();
  DateTimeColumn get tanggalSholat => dateTime().named('date_of_sholat')();

  TextColumn get imsak => text().named('imsak_time')();
  TextColumn get subuh => text().named('shubuh_time')();
  TextColumn get terbit => text().named('terbit_time')();
  TextColumn get dhuha => text().named('dhuha_time')();
  TextColumn get dzuhur => text().named('dhuhur_time')();
  TextColumn get ashar => text().named('ashar_time')();
  TextColumn get maghrib => text().named('maghrib_time')();
  TextColumn get isya => text().named('isya_time')();
}
