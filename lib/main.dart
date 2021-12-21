import 'package:flutter/material.dart';
import 'app_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dddedddddddddd',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AppMenu(),
    );
  }
}

