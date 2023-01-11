import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:signtome/data/local/db/app_db.dart';
import 'dart:convert';

import 'package:drift/drift.dart' as drift;

class HttpStateful {
  String imsak, shubuh, dhuhur;

  HttpStateful(
      {required this.imsak, required this.shubuh, required this.dhuhur});

  static connectAPI(
      String cityid, String monthnow, String yearnow, int i) async {
    Uri url = Uri.parse(
        "https://api.myquran.com/v1/sholat/jadwal/$cityid/$yearnow/$monthnow/$i");

    var hasilResponse = await http.get(url);
    var data = (json.decode(hasilResponse.body))["data"]["jadwal"];

    await appDb.insertJadwal(JadwalCompanion(
      // imsak: drift.Value(data["imsak"]),
      // subuh: drift.Value(data["subuh"]),

      tanggalasId: drift.Value(i),
      tanggalSholat: drift.Value(DateTime.parse(data["date"])),
      imsak: drift.Value(data["imsak"]),
      subuh: drift.Value(data["subuh"]),
      terbit: drift.Value(data["terbit"]),
      dhuha: drift.Value(data["dhuha"]),
      dzuhur: drift.Value(data["dzuhur"]),
      ashar: drift.Value(data["ashar"]),
      maghrib: drift.Value(data["maghrib"]),
      isya: drift.Value(data["isya"]),
    ));
  }
}
///Asasadasdw