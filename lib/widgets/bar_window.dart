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
            child: MoveWindow(),
          ),
          Row(
            children: [
              MinimizeWindowButton(colors: butttonColors),
              CloseWindowButton(colors: butttonColors),
            ],
          ),
        ],
      ),
    );
  }
}
