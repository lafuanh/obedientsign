import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:signtome/screens/home_screen.dart';

import 'screens/schedule_screen.dart';
import 'screens/setting_screen.dart';

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

int pageNumber = 1;

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
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
          Container(
            height: double.infinity,
            width: 50,
            color: Colors.black.withOpacity(0.5),
            child: Column(children: [
              WindowTitleBarBox(
                child: MoveWindow(),
              ),
              SidemenuIc(
                srcImage: "assets/ic_Home.png",
                onTap: () {
                  setState(() {
                    pageNumber = 1;
                  });
                },
              ),
              SidemenuIc(
                srcImage: "assets/ic_Clock.png",
                onTap: () {
                  setState(() {
                    pageNumber = 2;
                  });
                },
              ),
              SidemenuIc(
                srcImage: "assets/ic_Settings.png",
                onTap: () {
                  setState(() {
                    pageNumber = 3;
                  });
                },
              ),
              Expanded(child: Container(height: 50)),
              SidemenuIc(
                srcImage: "assets/ic_About.png",
                onTap: () {
                  setState(() {
                    pageNumber = 1;
                  });
                },
              ),
            ]),
          ),
          getWidget(),
          // HomeScreen(),
          // SchecduleScreen(),
          // SettingScreen(),
        ],
      ),
    );
  }

  getWidget() {
    if (pageNumber == 1) {
      return HomeScreen();
    } else if (pageNumber == 2) {
      return SchecduleScreen();
    } else if (pageNumber == 3) {
      return SettingScreen();
    }
  }
}

class SidemenuIc extends StatelessWidget {
  final String srcImage;
  final VoidCallback onTap;

  const SidemenuIc({
    Key? key,
    required this.srcImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: sort_child_properties_last
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 40,
        child: Image(
          width: 20,
          height: 20,
          image: AssetImage(srcImage),
        ),
      ),
      onTap: onTap,
    );
  }
}
