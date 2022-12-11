import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../widgets/bar_window.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Settings"),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text("Tampilan"),
                    Container(
                      width: 100,
                      height: 150,
                      color: Colors.amber,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
