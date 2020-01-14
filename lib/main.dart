import 'routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatUp',
      routes: routes,
      // theme: new ThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: Colors.orange[200],
      //   accentColor: Colors.white,
      //   backgroundColor: Colors.orange[200],
      //   buttonColor: Colors.orange[200],
      //   primaryTextTheme: TextTheme(),
      //   indicatorColor: Colors.orange[200],
      // ),
    );
  }
}
