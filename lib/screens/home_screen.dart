import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

// import '../widgets/live_clock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var butttonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.white.withOpacity(0.1),
  mouseDown: Colors.white.withOpacity(0.2),
  iconMouseDown: Colors.white,
  iconMouseOver: Colors.white,
);

//

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF1E1E26),
        child: Column(
          children: [
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: MoveWindow(),
                  ),
                  Row(
                    children: [
                      MinimizeWindowButton(colors: butttonColors),
                      CloseWindowButton(colors: butttonColors),
                    ],
                  ),
                ],
              ),
            ),
            // LiveClock(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
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

            // Container(
            //   width: 200,
            //   color: Colors.black,
            //   alignment: Alignment.center,
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 50,
            //         height: 150,
            //         color: Colors.amber,
            //       ),
            //       Container(
            //         width: 50,
            //         height: 50,
            //         color: Colors.blue,
            //       ),
            //       Container(
            //         width: 50,
            //         height: 50,
            //         color: Colors.green,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
