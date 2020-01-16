import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';

import 'routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapBloc>(
        create: (context) => MapBloc(),
        child: MaterialApp(
          title: 'WhatUp',
          initialRoute: '/login',
          routes: routes,
          theme: new ThemeData(
              // brightness: Brightness.light,
              // primaryColor: Colors.orange[200],
              // accentColor: Colors.white,
              // backgroundColor: Colors.orange[200],
              // buttonColor: Colors.orange[200],
              // primaryTextTheme: TextTheme(),
              appBarTheme: AppBarTheme(brightness: Brightness.light)),
        ));
  }
}
