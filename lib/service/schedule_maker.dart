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
  int today,
) async {
  // countMonthAPI(monthnow, yearnow);
  int total = await countMonthAPI(monthnow, yearnow);
  int count = await appDb.getSemuaJadwal().then((value) => value.length);
  if (count == 0) {
    for (int i = 1; i <= total; i++) {
      await HttpStateful.connectAPI(cityid, monthnow, yearnow, i);
      print("waiting list $i");
    }
  } else {
    await appDb.deleteAllJadwal();

    for (int i = 1; i <= total; i++) {
      await HttpStateful.connectAPI(cityid, monthnow, yearnow, i);
      print("waiting list $i");
    }
  }

  print("done- ~table schedule $total x");
  makeScreenData(today);
}

countMonthAPI(String monthnow, String yearnow) async {
  Uri url = Uri.parse(
      "https://api.myquran.com/v1/sholat/jadwal/1434/$yearnow/$monthnow");

  var hasilResponse = await http.get(url);
  var data = (json.decode(hasilResponse.body))["data"]["jadwal"].length;

  return int.parse(data.toString());
}

Future<void> makeScreenData(int todayNow) async {
  int count = await appDb.getSemuaScreen().then((value) => value.length);
  if (count == 0) {
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(1),
      switchNotif: drift.Value(false),
      name: drift.Value("imsak"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .imsak), //change to table jadwal imsak
      status: drift.Value("onGoing"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(2),
      switchNotif: drift.Value(false),
      name: drift.Value("subuh"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .subuh), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(3),
      switchNotif: drift.Value(false),

      name: drift.Value("terbit"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .terbit), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(4),
      switchNotif: drift.Value(false),

      name: drift.Value("dhuzur"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .dzuhur), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(5),
      switchNotif: drift.Value(false),

      name: drift.Value("ashar"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .ashar), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(6),
      switchNotif: drift.Value(false),

      name: drift.Value("maghrib"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .maghrib), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(7),
      switchNotif: drift.Value(false),
      name: drift.Value("isya"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .isya), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    print("screens stored");
  } else {
    await appDb.deleteAllSScreen();
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(1),
      switchNotif: drift.Value(false),
      name: drift.Value("imsak"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .imsak), //change to table jadwal imsak
      status: drift.Value("onGoing"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(2),
      switchNotif: drift.Value(false),
      name: drift.Value("subuh"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .subuh), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(3),
      switchNotif: drift.Value(false),

      name: drift.Value("terbit"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .terbit), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(4),
      switchNotif: drift.Value(false),

      name: drift.Value("dhuzur"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .dzuhur), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(5),
      switchNotif: drift.Value(false),

      name: drift.Value("ashar"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .ashar), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(6),
      switchNotif: drift.Value(false),

      name: drift.Value("maghrib"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .maghrib), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    await appDb.insertScreen(ScreenCompanion(
      id: drift.Value(7),
      switchNotif: drift.Value(false),
      name: drift.Value("isya"),
      timeClock: drift.Value((await appDb.getJadwal(todayNow))
          .isya), //change to table jadwal imsak
      status: drift.Value("waiting"), //waiting / complete
      jadwalId: drift.Value(todayNow), // days now
    ));
    print("screens alerdy exist"); //just update timeclock
  }

  // } else {
  //   // appDb.deleteAllSettings();
  //   // appDb.deleteAllJadwal();
  //   print("has been stored");

  //   // settings table is not empty
  // }
}
