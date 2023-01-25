import 'package:flutter/material.dart';

import '../data/local/db/app_db.dart';
import '../data/local/entity/jadwal_entity.dart';
import '../widgets/bar_window.dart';

class TableBulan extends StatefulWidget {
  const TableBulan({super.key});

  @override
  State<TableBulan> createState() => _TableBulan();
}

Future<List<JadwalData>> getSemuaJadwal() async {
  final jadwalQuery = await getSemuaJadwal();
  print(jadwalQuery);
  return jadwalQuery;
}

class _TableBulan extends State<TableBulan> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color(0xFF1E1E26),
            child: Column(children: [
              const WindowButton(),
              Container(
                  height: 200,
                  width: 500,
                  child: SingleChildScrollView(
                      child: FutureBuilder<List<JadwalData>>(
                          future: getSemuaJadwal(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<JadwalData>> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                        title:
                                            Text(snapshot.data![index].imsak),
                                        subtitle:
                                            Text(snapshot.data![index].subuh),
                                        trailing:
                                            Text(snapshot.data![index].terbit));
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          })))
            ])));
  }
}
