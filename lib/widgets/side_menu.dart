import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 50,
      color: Colors.black.withOpacity(0.5),
      child: Column(children: [
        WindowTitleBarBox(
          child: MoveWindow(),
        ),
        SidemenuIc(
          srcImage: "assets/ic_Home.png",
          onTap: () {},
        ),
        SidemenuIc(
          srcImage: "assets/ic_Clock.png",
          onTap: () {},
        ),
        SidemenuIc(
          srcImage: "assets/ic_Settings.png",
          onTap: () {},
        ),
        Expanded(child: Container(height: 50)),
        SidemenuIc(
          srcImage: "assets/ic_About.png",
          onTap: () {},
        ),
      ]),
    );
  }
}

class SidemenuIc extends StatelessWidget {
  final String srcImage;
  final VoidCallback onTap;

  const SidemenuIc({
    Key? key,
    required this.srcImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: sort_child_properties_last
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 40,
        child: Image(
          width: 20,
          height: 20,
          image: AssetImage(srcImage),
        ),
      ),
      onTap: onTap,
    );
  }
}
