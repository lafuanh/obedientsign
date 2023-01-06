import 'package:flutter/material.dart';

import 'package:signtome/data/data.dart';
import 'package:signtome/models/http_stateful.dart';

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
              HttpStateful.connectAPI("1434", "1", "2023", 1);
              // set list of settings in database where language with a code of city based on citiesList
              // then insert 30 times table of schedule
              // then returnif ready
              // Handle the button press
            },
            child: const Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
