import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signtome/widgets/bar_window.dart';

class SchecduleScreen extends StatefulWidget {
  const SchecduleScreen({super.key});

  @override
  State<SchecduleScreen> createState() => _SchecduleScreenState();
}

class _SchecduleScreenState extends State<SchecduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: Color(0xFF1E1E26),
          child: Column(
            children: [
              const WindowButton(), //Costume appBar
              Row(
                children: [Text("< "), Text("Surakarta, Indonesia")],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              ),

              SizedBox(
                height: 120, // constrain height
                child: GridView(
                    padding: EdgeInsets.all(8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 14 / 21,
                    ),
                    children: [
                      CardSchedule(
                        nameTimeS: "Imsak",
                        dateTimeS: "04:30",
                      ),
                      CardSchedule(
                        nameTimeS: "Shubuh",
                        dateTimeS: "04:40",
                      ),
                      CardSchedule(
                        nameTimeS: "Terbit",
                        dateTimeS: "05:40",
                      ),
                      CardSchedule(
                        nameTimeS: "Dhuzur",
                        dateTimeS: "12:40",
                      ),
                      CardSchedule(
                        nameTimeS: "Ashar",
                        dateTimeS: "15:40",
                      ),
                      CardSchedule(
                        nameTimeS: "Maghrib",
                        dateTimeS: "17:40",
                      ),
                      CardSchedule(
                        nameTimeS: "Isya",
                        dateTimeS: "18:40",
                      ),
                    ]),
              ),
              SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Waktu Dzuhur sudah Terlewat \n 1 jam 40 menit lalu",
                      textAlign: TextAlign.left,
                    ),
                  ))
            ],
          )),
    );
  }
}

class CardSchedule extends StatefulWidget {
  final String nameTimeS, dateTimeS;
  // final bool defaultAlarm; //database

  const CardSchedule({
    required this.nameTimeS,
    required this.dateTimeS,
    // required this.defaultAlarm, //data base
    Key? key,
  }) : super(key: key);

  @override
  State<CardSchedule> createState() => _CardScheduleState();
}

bool isActive = true;

class _CardScheduleState extends State<CardSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.nameTimeS),
            Text(widget.dateTimeS),
            InkWell(
              onTap: () {
                setState(() {
                  isActive ? isActive = false : isActive = true;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 50,
                  height: 40,
                  child: isActive
                      ? Image.asset("assets/alarmTrue.png")
                      : Image.asset("assets/alarmFalse.png")),
            ),
          ]),
    );
  }
}
