import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';

import '../service/cities.dart';
import '../service/schedule_maker.dart';
import '../service/status_service.dart';
import '../widgets/bar_window.dart';

import 'package:signtome/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;

import 'package:signtome/main.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedLanguage = "Bahasa Indonesia";
  String selectedLokasi =
      "Kota / Kab"; //if database == null set "kota / kab" :: Database

  int formatWaktu = 1;
  int selectedAlarm = 1;
  List<String> lokasiList = [];

  var now = DateTime.now();

  Future<void> readSettings() async {
    //change: better to make a class

    selectedLanguage = (await appDb.getSetting("settBahasa")).value;
    selectedLokasi = (await appDb.getSetting("settLokasi")).value;
    formatWaktu = int.parse((await appDb.getSetting("settFormat")).value);
    selectedAlarm = int.parse((await appDb.getSetting("settAlarm")).value);

    // Cities city = await citiesList.where((city) => city.id == codeLokasi).first;
    // selectedlocation = city.lokasi;
  }

  Future<void> savesettings() async {
    appDb.deleteAllSettings();
    Cities city =
        await citiesList.where((city) => city.lokasi == selectedLokasi).first;
    final codeLokasi = city.id;
    await appDb.insertSetting(SettingsCompanion(
      name: drift.Value("settBahasa"),
      value: drift.Value(selectedLanguage),
    ));
    await appDb.insertSetting(SettingsCompanion(
      name: drift.Value("settLokasi"),
      value: drift.Value(selectedLokasi),
    ));
    await appDb.insertSetting(SettingsCompanion(
      name: drift.Value("settFormat"),
      value: drift.Value(formatWaktu.toString()),
    ));

    await appDb.insertSetting(SettingsCompanion(
      name: drift.Value("settAlarm"),
      value: drift.Value(selectedAlarm.toString()),
    ));

    print("Settings debug: saved");

    final monthNow = DateFormat.M().format(now);
    final yearNow = DateFormat('y').format(now);
    final dayNow = DateFormat('d').format(now);

    await makeTable(codeLokasi, monthNow, yearNow, int.parse(dayNow));

    await checkAllStatusScreen();

    await changeNotifTime();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cities.json');
    final data = await json.decode(response);

    for (var city in data) {
      lokasiList.add(city['lokasi']);
    }
  }

  @override
  void initState() {
    readSettings();
    // TODO: implement initState
    super.initState();

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readSettings(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return layerSettings();
        } else {
          return layerSettings();
        }
      },
    );
    // return layerSettings();
  }

  Expanded layerSettings() {
    return Expanded(
      child: Container(
        color: Colors.black.withOpacity(0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WindowButton(), //Costume appBar
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Bahasa",
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.25),
                          width: 180,
                          height: 35,
                          margin: const EdgeInsets.all(8.0),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSelectedItems: true,
                              disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            items: [
                              "Bahasa Indonesia",
                              "English",
                            ],
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  constraints:
                                      BoxConstraints.tight(const Size(100, 30)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5)),
                            ),
                            onChanged: (value) {
                              selectedLanguage = value!;
                            },
                            selectedItem: selectedLanguage,
                          ),
                        ),
                        const Text(
                          "Pilih Lokasi",
                          textAlign: TextAlign.left,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Auto Check Lokasi",
                        //       style: TextStyle(
                        //           color: Colors.grey.withOpacity(0.9),
                        //           fontSize: 12),
                        //     ),
                        //     Switch(
                        //         value: statusSwitchLoc,
                        //         onChanged: (value) {
                        //           setState(() {
                        //             // someFunction(citiesList);
                        //             statusSwitchLoc = !statusSwitchLoc;
                        //           });
                        //         }),
                        //   ],
                        // ),
                        Container(
                          color: Colors.black.withOpacity(0.25),
                          width: 180,
                          height: 50,
                          margin: const EdgeInsets.all(8),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              showSelectedItems: true,
                              disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: lokasiList,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: "Kota / Kab Indonesia",
                                  border: InputBorder.none,
                                  constraints:
                                      BoxConstraints.tight(const Size(100, 32)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8)),
                            ),
                            onChanged: (value) {
                              selectedLokasi = value!; // change thiss
                              // print(selectedLokasi + " _debug");
                            },
                            selectedItem: selectedLokasi,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tampilan"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Format Waktu"),
                            Container(
                              margin: const EdgeInsets.only(left: 16),
                              width: 140,
                              height: 30,
                              color: Colors.black.withOpacity(0.5),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [
                                  "AM / PM",
                                  "24 Jam",
                                ],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 1)),
                                ),
                                onChanged: (value) {
                                  if (value == "AM / PM") {
                                    formatWaktu = 1;
                                  } else if (value == "24 Jam") {
                                    formatWaktu = 2;
                                  }
                                },
                                selectedItem: convertFwaktuToList(),
                              ),
                            )
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const Text("Notifikasi"),
                        //     Switch(
                        //       value: statusSwitchNotif,
                        //       onChanged: (value) async {
                        //         setState(() {
                        //           statusSwitchNotif = value;
                        //         });

                        //       },
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Alarm"),
                            Container(
                              margin: const EdgeInsets.only(left: 16, top: 16),
                              width: 200,
                              height: 35,
                              color: Colors.black.withOpacity(0.5),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                items: ["Adzan & pop notif", "pop notif saja"],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 1)),
                                ),
                                onChanged: (value) {
                                  if (value == "Adzan & pop notif") {
                                    selectedAlarm = 1;
                                  } else if (value == "pop notif saja") {
                                    selectedAlarm = 2;
                                  }
                                },
                                selectedItem: convertFalarmToList(),
                              ),
                            )
                          ],
                        ),
                        // Text("Volume Adzan"),
                        // Slider(
                        //     value: _value.toDouble(),
                        //     min: 1.0,
                        //     max: 20.0,
                        //     divisions: 10,
                        //     activeColor: Colors.white,
                        //     inactiveColor: Colors.grey.withOpacity(0.5),
                        //     // label: 'Set volume value',
                        //     onChanged: (double newValue) {
                        //       setState(() {
                        //         _value = newValue.round();
                        //       });
                        //     },
                        //     semanticFormatterCallback: (double newValue) {
                        //       return '${newValue.round()} dollars';
                        //     })

                        Row(
                          children: [
                            const Text(
                              "Please save Settings :",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 25),
                              child: FloatingActionButton(
                                mini: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  savesettings();
                                  // set list of settings in database where language with a code of city based on citiesList
                                  // then insert 30 times table of schedule
                                  // then returnif ready
                                  // Handle the button press
                                },
                                child: const Icon(Icons.save),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//   }

  convertFwaktuToList() {
    if (formatWaktu == 1) {
      return "AM / PM";
    } else if (formatWaktu == 2) {
      return "24 Jam";
    }
  }

  convertFalarmToList() {
    if (selectedAlarm == 1) {
      return "adzan & pop notif";
    } else if (selectedAlarm == 2) {
      return "pop notif saja"; //
    }
  }

  String convertFlokasiToCode(String cityID) {
    Cities city = citiesList.where((city) => city.id == cityID).first;
    return city.lokasi;
  }
}
