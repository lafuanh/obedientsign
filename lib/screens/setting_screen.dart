import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../widgets/bar_window.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool statusSwitchLoc = false;
  bool statusSwitchNotif = true;
  int _value = 6;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.black.withOpacity(0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WindowButton(), //Costume appBar
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 16.0,
            //   ),
            //   child: Text(
            //     "Settings",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Bahasa",
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.25),
                          width: 180,
                          height: 35,
                          margin: const EdgeInsets.all(8.0),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSelectedItems: true,
                              disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: [
                              "Bahasa Indonesia",
                              "English",
                            ],
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  constraints:
                                      BoxConstraints.tight(Size(100, 30)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5)),
                            ),
                            onChanged: print,
                            selectedItem: "Bahasa Indonesia",
                          ),
                        ),
                        Text(
                          "Pilih Lokasi",
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Auto Check Lokasi",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 12),
                            ),
                            Switch(
                                value: statusSwitchLoc,
                                onChanged: (value) {
                                  setState(() {
                                    statusSwitchLoc = !statusSwitchLoc;
                                  });
                                }),
                          ],
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.25),
                          width: 180,
                          height: 35,
                          margin: EdgeInsets.all(8),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              showSearchBox: true,
                              showSelectedItems: true,
                              disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: [
                              "Kab. Boyolali",
                              "Kab. Surakarta",
                            ],
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: "Kota / Kab Indonesia",
                                  border: InputBorder.none,
                                  constraints:
                                      BoxConstraints.tight(Size(100, 10)),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5)),
                            ),
                            onChanged: print,
                            // selectedItem: "Kab Boyolali",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tampilan"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Format Waktu"),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 140,
                              height: 30,
                              color: Colors.black.withOpacity(0.5),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                items: [
                                  "AM / PM",
                                  "24 Jam",
                                ],
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 1)),
                                ),
                                onChanged: print,
                                selectedItem: "AM / PM",
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Notifikasi"),
                            Switch(
                                value: statusSwitchNotif,
                                onChanged: (value) {
                                  setState(() {
                                    statusSwitchNotif = !statusSwitchNotif;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Alarm"),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              width: 200,
                              height: 30,
                              color: Colors.black.withOpacity(0.5),
                              child: DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                  disabledItemFn: (String s) =>
                                      s.startsWith('I'),
                                ),
                                items: [
                                  "Adzan",
                                  "suara notif dan pop notifikasi",
                                  "pop notif saja"
                                ],
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 1)),
                                ),
                                onChanged: print,
                                selectedItem: "Adzan",
                              ),
                            )
                          ],
                        ),
                        Text("Volume Adzan"),
                        Slider(
                            value: _value.toDouble(),
                            min: 1.0,
                            max: 20.0,
                            divisions: 10,
                            activeColor: Colors.white,
                            inactiveColor: Colors.grey.withOpacity(0.5),
                            // label: 'Set volume value',
                            onChanged: (double newValue) {
                              setState(() {
                                _value = newValue.round();
                              });
                            },
                            semanticFormatterCallback: (double newValue) {
                              return '${newValue.round()} dollars';
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
