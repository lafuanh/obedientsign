import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

var butttonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.white.withOpacity(0.1),
  mouseDown: Colors.white.withOpacity(0.2),
  iconMouseDown: Colors.white,
  iconMouseOver: Colors.white,
);

class WindowButton extends StatelessWidget {
  const WindowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
                // child: Row(
                //   children: [
                //     //change title please
                //     Padding(
                //       padding: EdgeInsets.only(left: 16.0, top: 8),
                //       child: Text(
                //         "Settings",
                //         style:
                //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ],
                // ),
                ),
          ),
          Row(
            children: [
              MinimizeWindowButton(colors: butttonColors),
              CloseWindowButton(
                colors: butttonColors,
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.black.withOpacity(0.5),
                        title: const Text('Exit Program?',
                            style: TextStyle(color: Colors.grey)),
                        content: const Text(
                            ('The window will be hidden, to exit the program you can use the system menu.'),
                            style: TextStyle(color: Colors.grey)),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              appWindow.hide();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
