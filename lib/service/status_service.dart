import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signtome/service/schedule_maker.dart';

import '../data/local/db/app_db.dart';

// Future checkAllStatusScreen() async {
//   DateTime currentTime = DateTime.now();
//   String time2 = DateFormat.Hm().format(currentTime);
//   for (int i = 1; i <= 7; i++) {
//     String time1 = (await appDb.getidScreen(i)).timeClock;
//     DateTime time1DT = DateTime.parse("1970-01-01 $time1");
//     DateTime time2DT = DateTime.parse("1970-01-01 $time2");

//     if (time1DT.compareTo(time2DT) > 0) {
//       print("$time1 is greater than $time2");

//       break;
//     } else if (time1DT.compareTo(time2DT) < 0) {
//       print("$time1 is not greater than $time2");
//     } else {
//       print("$time1 is equals $time2. Setting status to waiting");
//     }
//   }
// }
var now = DateTime.now();

Future<void> checkAllStatusScreen(String condition) async {
  if (condition == "nextday") {
    for (int i = 1; i <= 7; i++) {
      String time1 = (await appDb.getidScreen(i)).timeClock;
      DateTime currentTimeNow = DateTime.now();
      DateTime currentTime = currentTimeNow.add(const Duration(days: 1));

      String date =
          "${currentTime.year}-${currentTime.month.toString().padLeft(2, '0')}-${currentTime.day.toString().padLeft(2, '0')}";
      DateTime time1DT = DateTime.parse("$date $time1");
      //make 2023-01-13 auto

      if (time1DT.isAfter(currentTimeNow)) {
        print("$time1 is greater than $currentTime. Setting status to onGoing");
        await appDb.updateScreenStatusId(i, "onGoing");
        // update your status to onGoing here
        break;
      } else if (time1DT.isBefore(currentTimeNow)) {
        print("$time1 is before $currentTime. Setting status to complete");
        await appDb.updateScreenStatusId(i, "complete");

        // update your status to complete here
      } else {
        print("$time1 is equals $currentTime. Setting status to waiting");
        await appDb.updateScreenStatusId(i, "complete");
        // update your status to waiting here
      }
    }
  } else {
    for (int i = 1; i <= 7; i++) {
      String time1 = (await appDb.getidScreen(i)).timeClock;
      DateTime currentTime = DateTime.now();

      String date =
          "${currentTime.year}-${currentTime.month.toString().padLeft(2, '0')}-${currentTime.day.toString().padLeft(2, '0')}";
      DateTime time1DT = DateTime.parse("$date $time1");
      //make 2023-01-13 auto

      if (time1DT.isAfter(currentTime)) {
        print("$time1 is greater than $currentTime. Setting status to onGoing");
        await appDb.updateScreenStatusId(i, "onGoing");
        // update your status to onGoing here
        break;
      } else if (time1DT.isBefore(currentTime)) {
        print("$time1 is before $currentTime. Setting status to complete");
        await appDb.updateScreenStatusId(i, "complete");

        // update your status to complete here
      } else {
        print("$time1 is equals $currentTime. Setting status to waiting");
        await appDb.updateScreenStatusId(i, "complete");
        // update your status to waiting here
      }
    }

    final isya = (await appDb.getidScreen(7)).status;
    final dayNow = int.parse(DateFormat('d').format(now));
    if (isya == "complete") {
      await makeScreenData(dayNow + 1);

      await checkAllStatusScreen("nextday");
    }
  }
}
