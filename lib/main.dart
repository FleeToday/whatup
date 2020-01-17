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
          initialRoute: '/login',
          routes: routes,
        ));
  }
}
