import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';

import 'blocs/SimpleBlocDelegate.dart';
import 'routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = SimpleBlocDelegate();
    final ActivityBloc activityBloc = ActivityBloc();
    final LocationInputBloc locationInputBloc = LocationInputBloc();
    final MapBloc mapBloc = MapBloc(activityBloc: activityBloc)
      ..add(ResetCamera());
    final AuthBloc authBloc = AuthBloc(Repository());

    return MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(create: (context) => mapBloc),
          BlocProvider<ActivityBloc>(create: (context) => activityBloc),
          BlocProvider<LocationInputBloc>(
              create: (context) => locationInputBloc),
          BlocProvider<AuthBloc>(create: (context) => authBloc),
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
