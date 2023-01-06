import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpStateful {
  String imsak, shubuh, dhuhur;

  HttpStateful(this.imsak, this.shubuh, this.dhuhur);

  static connectAPI(
      String cityid, String monthnow, String yearnow, int i) async {
    Uri url = Uri.parse("https:api.myquran.com/v1/sholat/jadwal/" +
        cityid +
        "/" +
        yearnow +
        "/" +
        monthnow +
        "/" +
        i.toString());

    var hasilResponse = await http.get(url);
    var data = json.decode(hasilResponse.body);

    print(data);
  }
}
///Asasadasdw