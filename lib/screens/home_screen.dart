import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signtome/data/local/db/app_db.dart';
import 'package:signtome/screens/setting_screen.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:hijri/hijri_calendar.dart';
import '../main.dart';
import '../widgets/bar_window.dart';

// import '../widgets/live_clock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String onGoingName = "dhuzur";
  String ongGoingWaktu = "11:48";
  String locationNow = "Surakrta";
  Future<void> checkingData() async {
    // final codeLocation = (await appDb.getSetting("settLokasi")).value;
    locationNow = (await appDb.getSetting("settLokasi")).value;

    onGoingName = (await appDb.getStatusScreen("onGoing")).name!;
    ongGoingWaktu = (await appDb.getStatusScreen("onGoing")).timeClock;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkingData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkingData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return updateScreen();
        } else {
          return updateScreen();
        }
      },
    );
    // return updateScreen();
  }

  Expanded updateScreen() {
    return Expanded(
      child: Container(
        color: Color(0xFF1E1E26),
        child: Column(
          children: [
            const WindowButton(), //Costume appBar

            const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerBuilder.periodic(const Duration(seconds: 1),
                    builder: (context) {
                  var now = DateTime.now();
                  var formatTime = DateFormat.Hm().format(now);
                  var formatSec = DateFormat('s').format(now);
                  var formatedDay = DateFormat('EEEEE', 'en_US').format(now);
                  var _format = HijriCalendar.now();

                  return Column(
                    children: [
                      Center(
                        child: Text(
                          formatTime + ':' + formatSec,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(_format.fullDate() + "H"),
                      )
                    ],
                  );
                }),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      width: 200,
                      height: 35,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 9),
                          )
                        ],
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      child: Text(
                        "$locationNow, Indonesia",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.centerLeft,
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onGoingName,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ongGoingWaktu,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
