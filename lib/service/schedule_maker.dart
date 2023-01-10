import 'package:signtome/models/http_stateful.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
