import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:signtome/data/local/db/app_db.dart';
import 'package:signtome/widgets/bar_window.dart';

import 'package:drift/drift.dart' as drift;
import 'package:timer_builder/timer_builder.dart';

class SchecduleScreen extends StatefulWidget {
  const SchecduleScreen({super.key});

  @override
  State<SchecduleScreen> createState() => _SchecduleScreenState();
}

String lokasi = "indonesia";
String imsak = "04:30";
String subuh = "04:40";
String terbit = "04:40";
String dhuzur = "04:40";
String ashar = "04:40";
String maghrib = "04:40";
String isya = "04:40";

Future<void> readScreen() async {
  //change: better to make a class
  lokasi = (await appDb.getSetting("settLokasi")).value;

  imsak = (await appDb.getScreen("imsak")).timeClock;
  subuh = (await appDb.getScreen("subuh")).timeClock;
  terbit = (await appDb.getScreen("terbit")).timeClock;
  dhuzur = (await appDb.getScreen("dhuzur")).timeClock;
  ashar = (await appDb.getScreen("ashar")).timeClock;
  maghrib = (await appDb.getScreen("maghrib")).timeClock;
  isya = (await appDb.getScreen("isya")).timeClock;
}

// Future<void> checkTableStats() async {
//   //change: better to make a class
//   for (items on table){
//     if((await appDb.getidScreen(i)).status; == "waiting") => check
//   }

//   if ((await appDb.getidScreen(i)).jadwalId; == !today) => update alloftime => check list waiting

// }

class _SchecduleScreenState extends State<SchecduleScreen> {
  @override
  void initState() {
    // TODO: implement initState
    readScreen();
  }

  String _text = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readScreen(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return updateScreen();
        } else {
          return updateScreen();
        }
      },
    );
    // return layerSettings();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return plainScreen();
  // }

  Expanded updateScreen() {
    return Expanded(
      child: Container(
          color: Color(0xFF1E1E26),
          child: Column(
            children: [
              const WindowButton(), //Costume appBar
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("> "),
                  ),
                  Text("$lokasi, Indonesia")
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              ),

              SizedBox(
                height: 120, // constrain height
                child: GridView(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 14 / 21,
                    ),
                    children: [
                      CardSchedule(
                        nameTimeS: "Imsak",
                        dateTimeS: imsak,
                      ),
                      CardSchedule(
                        nameTimeS: "Shubuh",
                        dateTimeS: subuh,
                      ),
                      CardSchedule(
                        nameTimeS: "Terbit",
                        dateTimeS: terbit,
                      ),
                      CardSchedule(
                        nameTimeS: "Dhuzur",
                        dateTimeS: dhuzur,
                      ),
                      CardSchedule(
                        nameTimeS: "Ashar",
                        dateTimeS: ashar,
                      ),
                      CardSchedule(
                        nameTimeS: "Maghrib",
                        dateTimeS: maghrib,
                      ),
                      CardSchedule(
                        nameTimeS: "Isya",
                        dateTimeS: isya,
                      ),
                    ]),
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TimerBuilder.periodic(const Duration(minutes: 1),
                        builder: (context) {
                      var now = DateTime.now();
                      var targetTimeString =
                          "00:00"; //change this to current on going time
                      var targetTimeArray = targetTimeString.split(':');
                      var targetTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          int.parse(targetTimeArray[0]),
                          int.parse(targetTimeArray[1]));

                      // calculate the difference between the current time and the target time
                      var difference = targetTime.difference(now);

                      Future changeTargetTime() async {
                        targetTimeString =
                            (await appDb.getStatusScreen("onGoing")).timeClock;
                        targetTimeArray = targetTimeString.split(':');

                        targetTime = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            int.parse(targetTimeArray[0]),
                            int.parse(targetTimeArray[1]));

                        final aTime = targetTime.difference(now);

                        _text =
                            "Waktu sholat selanjutnya: \n ${aTime.inHours} jam ${aTime.inMinutes.remainder(60)} menit lagi";
                      }

                      if (difference.inHours == 0 &&
                          difference.inMinutes == 0) {
                        changeTargetTime();
                      } else if (targetTimeString == "00:00") {
                        changeTargetTime();
                      } else {
                        _text =
                            "Waktu sholat selanjutnya: \n ${difference.inHours} jam ${difference.inMinutes.remainder(60)} menit lagi";
                      }

                      // update the text displayed in the Text widget

                      //show notifikasi
                      //if diffrence inhous == 0 || diffrence .inMinutes == 0
                      // change targetime

                      return Text(
                        _text,
                        textAlign: TextAlign.left,
                      );
                    }),
                  ))
            ],
          )),
    );
  }
}

class CardSchedule extends StatefulWidget {
  final String nameTimeS, dateTimeS;
  // final bool defaultAlarm; //database

  const CardSchedule({
    required this.nameTimeS,
    required this.dateTimeS,
    // required this.defaultAlarm, //data base
    Key? key,
  }) : super(key: key);

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

class _CardScheduleState extends State<CardSchedule> {
  bool isActive = true;
  Future<void> readSwitch() async {
    //change: better to make a class
    isActive = (await appDb.getScreen(widget.nameTimeS)).switchNotif;
  }

  Future<void> updateSwitch() async {
    if (isActive == true) {
      isActive = false;
    } else if (isActive == false) {
      isActive = true;
    }
    //change: better to make a class
    await appDb.updateScreen(ScreenCompanion(
      name: drift.Value(widget.nameTimeS),
      switchNotif: drift.Value(isActive),
    ));

    print(isActive);
  }

  @override
  void initState() {
    // TODO: implement initState
    // readSwitch();
  }

  @override
  Widget build(BuildContext context) {
    return updatecolumn();
    // return FutureBuilder(
    //     future: readSwitch(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return updatecolumn();
    //       } else {
    //         return updatecolumn();
    //       }
    //     });
  }

  Container updatecolumn() {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.nameTimeS),
            Text(widget.dateTimeS),
            InkWell(
              onTap: () {
                // setState(() {
                //   updateSwitch();
                // });
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 50,
                  height: 40,
                  child: isActive
                      ? Image.asset("assets/alarmTrue.png")
                      : Image.asset("assets/alarmFalse.png")),
            ),
          ]),
    );
  }
}
