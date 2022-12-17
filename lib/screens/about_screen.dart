import 'package:flutter/material.dart';

import 'package:signtome/data/data.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(waktuSholat.first.alarm.toString()),
      ],
    );
  }
}
