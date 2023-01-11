import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import '../widgets/bar_window.dart';

// import '../widgets/live_clock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                        child: Text(formatedDay),
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
                      child: const Text(
                        "Surakarta, Indonesia",
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
                              "Dhuzur",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "11:34",
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
