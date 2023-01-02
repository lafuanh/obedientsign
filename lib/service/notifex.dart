import 'dart:io';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:preference_list/preference_list.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:signtome/data/data.dart';
import 'package:tray_manager/tray_manager.dart';

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

LocalNotification? notifAdzanShubuh = LocalNotification(
  //buat notif nya disini 2...
  identifier: 'notif untuk shubuh',
  title: "Waktu shubuh Telah Tiba",
  body: waktuSholat.first.namaJadwal, // ??
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
  title: "Waktu Dzuhur Telah Tiba",
  body: "11:30 ",
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
  identifier: 'notif untuk dhuhur',
  title: "Waktu Dzuhur Telah Tiba",
  body: "11:30 ",
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
  title: "Waktu Dzuhur Telah Tiba",
  body: "11:30 ",
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
  identifier: 'notif untuk dhuhur',
  title: "Waktu Dzuhur Telah Tiba",
  body: "11:30 ",
  actions: [
    // LocalNotificationAction(
    //   text: 'Yes',
    // ),
    // LocalNotificationAction(
    //   text: 'No',
    // ),
  ],
);

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
