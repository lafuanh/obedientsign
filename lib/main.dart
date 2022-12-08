import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:signtome/screens/home_screen.dart';
import 'package:window_size/window_size.dart';

import 'widgets/side_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMinSize(const Size(600, 250));
    setWindowMaxSize(const Size(600, 250));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
        body: Column(
      children: [
        Expanded(
            child: Row(
          children: const [
            SideMenu(),
            // HomeScreen(),
          ],
        ))
      ],
    ));
  }
}
