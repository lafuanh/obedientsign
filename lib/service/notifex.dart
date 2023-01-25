import 'dart:io';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:preference_list/preference_list.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:signtome/data/data.dart';
import 'package:tray_manager/tray_manager.dart';

import '../data/local/db/app_db.dart';

class Notifex extends StatefulWidget {
  @override
  _NotifexState createState() => _NotifexState();
}

LocalNotification? _exampleNotification = LocalNotification(
  //buat notif nya disini 1
  identifier: 'origin exampleNotification',
  title: "Waktu Maghrib Telah Tiba",
  body: "17:54 ",
  actions: [
    // LocalNotificationAction(
    //   text: 'siap',
    // ),
    // LocalNotificationAction(
    //   text: 'Tutup',
    // ),
  ],
);

String timeforNow = "";
LocalNotification? notifAdzanShubuh = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk shubuh',
  title: "Waktu Shubuh Telah Tiba",
  body: timeforNow, // ??
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);

LocalNotification? notifAdzanDhuhur = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk dhuhur',
  title: "Waktu Dhuhur Telah Tiba",
  body: timeforNow,
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);
LocalNotification? notifAdzanAshar = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk Ashar',
  title: "Waktu Ashar Telah Tiba",
  body: timeforNow,
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);
LocalNotification? notifAdzanMaghrib = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk dhuhur',
  title: "Waktu Maghrib Telah Tiba",
  body: timeforNow,
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);
LocalNotification? notifAdzanIsya = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk Isya',
  title: "Waktu Isya Telah Tiba",
  body: timeforNow,
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);

Future showNotifNow(String name) async {
  timeforNow = (await appDb.getStatusScreen("onGoing")).timeClock;

  switch (name) {
    case 'shubuh':
      notifAdzanShubuh?.show();
      break;
    case 'dhuzur':
      notifAdzanDhuhur?.show();
      break;
    case 'ashar':
      notifAdzanAshar?.show();
      break;
    case 'maghrib':
      notifAdzanMaghrib?.show();
      break;
    case 'isya':
      notifAdzanIsya?.show();
      break;
    default:
      print('Invalid prayer time');
  }
}

class _NotifexState extends State<Notifex> with TrayListener {
  @override
  void initState() {
    trayManager.addListener(this);
    super.initState();
  }

  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: <Widget>[
        PreferenceListSection(
          title: Text('${_exampleNotification?.identifier}'),
          children: [
            PreferenceListItem(
              title: Text('show'),
              onTap: () =>
                  _exampleNotification?.show(), // key for showing notif
            ),
            PreferenceListItem(
              title: Text('close'),
              onTap: () => _exampleNotification?.close(),
            ),
            PreferenceListItem(
              title: Text('destroy'),
              onTap: () async {
                await _exampleNotification?.destroy();
                _exampleNotification = null;
                setState(() {});
              },
            ),
          ],
        ),
        PreferenceListSection(
          title: Text('${notifAdzanDhuhur?.identifier}'),
          children: [
            PreferenceListItem(
              title: Text('show'),
              onTap: () => notifAdzanDhuhur?.show(), // key for showing notif
            ),
            PreferenceListItem(
              title: Text('close'),
              onTap: () => notifAdzanDhuhur?.close(),
            ),
            PreferenceListItem(
              title: Text('destroy'),
              onTap: () async {
                await notifAdzanDhuhur?.destroy();
                notifAdzanDhuhur = null;
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBody(context),
      ],
    );
  }

  @override
  void onTrayIconMouseDown() {
    trayManager.popUpContextMenu();
  }
}
