import 'package:flutter/material.dart';

import 'package:signtome/service/schedule_maker.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Please save Settings :",
          style: TextStyle(color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 25),
          child: FloatingActionButton(
            mini: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            onPressed: () {
              setState(() {
                makeTable("1434", "1", "2023");
              });
            },
            child: const Icon(Icons.save),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 25),
          child: FloatingActionButton(
            mini: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            onPressed: () {
              setState(() {
                // countDays();
              });
            },
            child: const Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
