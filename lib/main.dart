import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';

import 'routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(
              create: (context) =>
                  MapBloc()..add(UpdateMapToCurrentLocation())),
        ],
        child: MaterialApp(
          title: 'WhatUp',
          initialRoute: '/',
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
