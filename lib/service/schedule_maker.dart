import 'package:signtome/models/http_stateful.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;

int totalThis = 20;

Future<void> makeTable(
  String cityid,
  String monthnow,
  String yearnow,
) async {
  // countMonthAPI(monthnow, yearnow);
  int total = await countMonthAPI(monthnow, yearnow);
  for (int i = 1; i <= total; i++) {
    await HttpStateful.connectAPI(cityid, monthnow, yearnow, i);
    print("waiting list $i");
  }
  print("done- ~table schedule $total x");
}

countMonthAPI(String monthnow, String yearnow) async {
  Uri url = Uri.parse(
      "https://api.myquran.com/v1/sholat/jadwal/1434/$yearnow/$monthnow");

  var hasilResponse = await http.get(url);
  var data = (json.decode(hasilResponse.body))["data"]["jadwal"].length;

  return int.parse(data.toString());
}

Future<void> makeScreenData() async {
  // if (count == 0) {
  // settings table is empty
  // insert data into the table
  // ignore: prefer_const_constructors

  await appDb.insertScreen(ScreenCompanion(
    id: drift.Value(1),
    switchNotif: drift.Value(false),
    name: drift.Value("imsak"),
    timeClock: drift.Value(
        (await appDb.getJadwal(11)).imsak), //change to table jadwal imsak
    status: drift.Value("waiting"), //waiting / complete
    // jadwalId: drift.Value(11), // days now
  ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(2),
  //   switchNotif: drift.Value(false),
  //   name: drift.Value("subuh"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).subuh), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(3),
  //   switchNotif: drift.Value(false),

  //   name: drift.Value("terbit"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).terbit), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(4),
  //   switchNotif: drift.Value(false),

  //   name: drift.Value("dhuzur"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).dzuhur), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(5),
  //   switchNotif: drift.Value(false),

  //   name: drift.Value("ashar"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).ashar), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(6),
  //   switchNotif: drift.Value(false),

  //   name: drift.Value("maghrib"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).maghrib), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  // await appDb.insertScreen(ScreenCompanion(
  //   id: drift.Value(7),
  //   switchNotif: drift.Value(false),
  //   name: drift.Value("isya"),
  //   timeClock: drift.Value(
  //       (await appDb.getJadwal(11)).isya), //change to table jadwal imsak
  //   status: drift.Value("waiting"), //waiting / complete
  //   jadwalId: drift.Value(11), // days now
  // ));
  print("screens stored");
  // } else {
  //   // appDb.deleteAllSettings();
  //   // appDb.deleteAllJadwal();
  //   print("has been stored");

  //   // settings table is not empty
  // }
}
