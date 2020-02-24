import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/HomeScreen/bloc/bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_bloc.dart';

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
    final AuthBloc authBloc = AuthBloc(Repository())..add(CheckSignIn());
    final UserProfileBloc userProfileBloc = UserProfileBloc(Repository());
    TextTheme textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
        providers: [
          BlocProvider<MapBloc>(create: (context) => mapBloc),
          BlocProvider<ActivityBloc>(create: (context) => activityBloc),
          BlocProvider<LocationInputBloc>(
              create: (context) => locationInputBloc),
          BlocProvider<AuthBloc>(
            create: (context) => authBloc,
          ),
          BlocProvider<UserProfileBloc>(
            create: (context) => userProfileBloc,
          ),
        ],
        child: MaterialApp(
          title: 'WhatUp',
          initialRoute: '/',
          routes: routes,
          theme: new ThemeData(
              // brightness: Brightness.light,
              // primaryColor: Color.fromRGBO(235, 235, 240, 1),
              // primaryColorDark: Color.fromRGBO(225, 225, 240, 1),
              //     // primaryColorLight: Colors.amber[300],
              //     // accentColor: Colors.orange[800],
              //     // backgroundColor: Colors.orange[200],
              //     // buttonColor: Colors.orange[200],
              //     primaryTextTheme: TextTheme(),
              //     appBarTheme: AppBarTheme(brightness: Brightness.light)
              ),
        ));
  }
}
