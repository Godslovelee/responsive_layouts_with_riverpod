import 'package:flutter/material.dart';
import 'app_menu.dart';
import 'first_page.dart';
import 'second_page.dart';

class SplitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;
    if (screenWidth >= breakpoint) {
      // widescreen: menu on the left, content on the right
      return Row(
        children: [
          // use SizedBox to constrain the AppMenu to a fixed width
          SizedBox(
            width: 240,

            child: AppMenu(),
          ),
          // vertical black line as separator
          Container(width: 0.5, color: Colors.black),
          // use Expanded to take up the remaining horizontal space
          Expanded(

            child: FirstPage(),
          ),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        body: FirstPage(),
        // use SizedBox to contrain the AppMenu to a fixed width
        drawer: SizedBox(
          width: 240,
          child: Drawer(
            child: AppMenu(),
          ),
        ),
      );
    }
  }
}
