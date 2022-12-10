import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:signtome/screens/home_screen.dart';

import 'widgets/side_menu.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    var intialSize = const Size(600, 250);
    appWindow.size = intialSize;
    appWindow.minSize = intialSize;
    appWindow.maxSize = intialSize;
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        primaryColor: Colors.black,
      ),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 10,
      //   backgroundColor: Colors.green,
      //   elevation: 0,
      //   leading: Row(children: [
      //     MinimizeWindowButton(colors: butttonColors),
      //     MaximizeWindowButton(colors: butttonColors),
      //     CloseWindowButton(colors: butttonColors),
      //   ]),
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideMenu(),
          HomeScreen(),
        ],
      ),
    );
  }
}
