import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:signtome/data/local/entity/settings_entity.dart';
import '../entity/jadwal_entity.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'jadwal.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Settings, Jadwal])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //get the list of jadwal
  Future<List<JadwalData>> getSemuaJadwal() async {
    return await select(jadwal).get();
  }

  Future<JadwalData> getJadwal(int id) async {
    return await (select(jadwal)..where((tbl) => tbl.tanggalasId.equals(id)))
        .getSingle();
  }

  Future<bool> updateJadwal(JadwalCompanion entity) async {
    return await update(jadwal).replace(entity);
  }

  Future<int> insertJadwal(JadwalCompanion entity) async {
    return await into(jadwal).insert(entity);
  }

  Future<int> deleteJadwal(int id) async {
    return await (delete(jadwal)..where((tbl) => tbl.tanggalasId.equals(id)))
        .go();
  }

  Future<int> deleteAllJadwal() async {
    return await (delete(jadwal)).go();
  }

  //_________________________//
  //get the list of Settings
  Future<List<Setting>> getSemuaSetting() async {
    return await select(settings).get();
  }

  Future<Setting> getSetting(String name) async {
    return await (select(settings)..where((tbl) => tbl.name.equals(name)))
        .getSingle();
  }

  Future<bool> updateSetting(SettingsCompanion entity) async {
    return await update(settings).replace(entity);
  }

  Future<int> insertSetting(SettingsCompanion entity) async {
    return await into(settings).insert(entity);
  }

  Future<int> deleteAllSettings() async {
    return await (delete(settings)).go();
  }
}
