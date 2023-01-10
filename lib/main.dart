// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart' hide MenuItem;

import 'package:flutter/services.dart';
import 'package:signtome/service/cities.dart';

import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

import 'package:system_tray/system_tray.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:local_notifier/local_notifier.dart';

import 'package:signtome/screens/about_screen.dart';
import 'package:signtome/screens/home_screen.dart';
import 'data/data.dart';
import 'screens/schedule_screen.dart';
import 'screens/setting_screen.dart';
import 'service/notifex.dart';

import 'package:signtome/data/local/db/app_db.dart';

import 'package:drift/drift.dart' as drift;

/*
Note:
Please edit : Change
todo: 1. App Icon still flutter

home its not work if u change page, maybe u should make own timeBuilder in this home

*/

List<dynamic> citiesList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localNotifier.setup(
    appName: 'Adzan', //name Notif
    shortcutPolicy: ShortcutPolicy.requireCreate,
  );

  runApp(const MyApp());

  doWhenWindowReady(() {
    var intialSize = const Size(600, 250); //change window

    appWindow.size = intialSize;
    appWindow.minSize = intialSize;
    appWindow.maxSize = intialSize;
    appWindow.show();
  });

  // await windowManager.ensureInitialized();
}

String getTrayImagePath(String imageName) {
  return Platform.isWindows ? 'assets/$imageName.ico' : 'assets/$imageName.png';
}

String getImagePath(String imageName) {
  return Platform.isWindows ? 'assets/$imageName.bmp' : 'assets/$imageName.png';
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
  //---//
  // database check if exist

  Future<void> checkDataExist() async {
    int count = await appDb.getSemuaSetting().then((value) => value.length);
    if (count == 0) {
      // settings table is empty
      // insert data into the table
      // ignore: prefer_const_constructors
      await appDb.insertSetting(SettingsCompanion(
        name: drift.Value("settBahasa"),
        value: drift.Value("Bahasa Indonesia"),
      ));
      await appDb.insertSetting(SettingsCompanion(
        name: drift.Value("settLokasi"),
        value: drift.Value("1434"),
      ));
      await appDb.insertSetting(SettingsCompanion(
        name: drift.Value("settFormat"),
        value: drift.Value("1"),
      ));

      await appDb.insertSetting(SettingsCompanion(
        name: drift.Value("settAlarm"),
        value: drift.Value("1"),
      ));
      print("COmplete");
    } else {
      // appDb.deleteAllSettings();
      // appDb.deleteAllJadwal();
      print("Berisi");

      // settings table is not empty
    }
  }

  //------------------------//
  // Json To Dart

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cities.json');
    final data = await json.decode(response);

    setState(() {
      citiesList = data.map((data) => Cities.fromJson(data)).toList();
    });
  }

  final AppWindow _appWindow = AppWindow();
  final SystemTray _systemTray = SystemTray();
  final Menu _menuMain = Menu();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    initSystemTray();

    readJson();
    checkDataExist();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  Future<void> initSystemTray() async {
    // We first init the systray menu and then add the menu entries
    await _systemTray.initSystemTray(iconPath: getTrayImagePath('mosqueW'));
    _systemTray.setTitle("Adzan Time");
    _systemTray.setToolTip("Jadwal Adzan"); // Change : "Jadwal Adzan - dhuhur"

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      // debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? _appWindow.show() : _systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? _systemTray.popUpContextMenu() : _appWindow.show();
      }
    });

    await _menuMain.buildFrom(
      [
        MenuItemLabel(
          label: '09 Muharamm tanngal', // Change : "Tanggal Terkini"
          onClicked: (menuItem) async {
            setState(() {
              pageNumber = 1;
            });
            appWindow.show();
          },
        ),
        MenuItemLabel(
          label: 'Jadwal Sholat', // Change : "dhuhur - 12:34"
          onClicked: (menuItem) async {
            setState(() {
              pageNumber = 2;
            });
            appWindow.show();
          },
        ),
        MenuSeparator(),
        MenuItemLabel(
            label: 'Exit', onClicked: (menuItem) => _appWindow.close()),
      ],
    );

    _systemTray.setContextMenu(_menuMain);
  }

  Future<void> printImsakInRow9() async {
    // Get the JadwalData object for the row with ID 9
    JadwalData jadwalData = await appDb.getJadwal(30);

    // // Print the value of the "imsak" column
    print(DateFormat("yyyy-MM-dd").format(jadwalData.tanggalSholat));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
            var now = DateTime.now();
            var formatTime = DateFormat.Hm().format(now);
            var formatSec = DateFormat('s').format(now);
            var formatedDay = DateFormat('EEEEE', 'en_US').format(now);

            //show notification
            if (int.parse(formatSec) == 45) {
              // printImsakInRow9();
              // int counter = 0;
              // for (var city in citiesList) {
              //   if (counter < 2) {
              //     print(city);
              //   } else {
              //     break;
              //   }
              //   counter++;
              // }
            }

            return Column();
          }),
          Container(
            height: double.infinity,
            width: 50,
            color: Colors.black.withOpacity(0.5),
            child: Column(children: [
              WindowTitleBarBox(
                child: MoveWindow(),
              ),
              SidemenuIc(
                srcImage: changeIconColor(1, "assets/sidemenu/ic_Home_w.png",
                    "assets/sidemenu/ic_Home_g.png"),
                onTap: () {
                  setState(() {
                    pageNumber = 1;
                  });
                },
              ),
              SidemenuIc(
                srcImage: changeIconColor(2, "assets/sidemenu/ic_Clock_w.png",
                    "assets/sidemenu/ic_Clock_g.png"),
                onTap: () {
                  setState(() {
                    pageNumber = 2;
                  });
                },
              ),
              SidemenuIc(
                srcImage: changeIconColor(
                    3,
                    "assets/sidemenu/ic_Settings_w.png",
                    "assets/sidemenu/ic_Settings_g.png"),
                onTap: () {
                  setState(() {
                    pageNumber = 3;
                  });
                },
              ),
              Expanded(child: Container(height: 50)),
              SidemenuIc(
                srcImage: changeIconColor(4, "assets/sidemenu/ic_About_w.png",
                    "assets/sidemenu/ic_About_g.png"),
                onTap: () {
                  setState(() {
                    pageNumber = 4;
                  });
                },
              ),
            ]),
          ),
          getWidget(),
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
    } else if (pageNumber == 4) {
      //change to : aboutme()
      return Aboutme();
    }
  }
}

changeIconColor(int nPage, String imageW, String imageG) {
  if (pageNumber == nPage) {
    return imageW;
  } else {
    return imageG;
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
