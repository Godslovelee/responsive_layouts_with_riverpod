import 'package:flutter/material.dart';
import 'app_menu.dart';


class SplitView extends StatelessWidget {
  const SplitView({required Key key,
   required this.menu , required this.content, this.menuWidth = 240, this.breakpoint = 600,
  }) : super(key: key);
  final Widget menu;
  final Widget content;
  final double breakpoint;
  final double menuWidth;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    if (screenWidth >= breakpoint) {
      // wide screen: menu on the left, content on the right
      return Row(
        children: [
          // use SizedBox to constrain the AppMenu to a fixed width
          SizedBox(

            width: menuWidth,

            child: AppMenu(),
          ),
          // vertical black line as separator
          Container(width: 0.5, color: Colors.black),
          // use Expanded to take up the remaining horizontal space
          Expanded(
            //
            child: content,
          ),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        body: content,
        // use SizedBox to constrain the AppMenu to a fixed width
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
