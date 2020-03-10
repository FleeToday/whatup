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
            // fontFamily: 'ArialRoundedBold',
            // brightness: Brightness.light,
            primaryColorLight: Color.fromRGBO(255, 153, 51, 1),
            primaryColorDark: Color.fromRGBO(232, 67, 48, 1),
            primaryColor: Color.fromRGBO(242, 105, 90, 1),
            //     // primaryColorLight: Colors.amber[300],
            //     // accentColor: Colors.purple[800],
            //     // backgroundColor: mainColor,
            //     // buttonColor: mainColor,
            //     primaryTextTheme: TextTheme(),
            //     appBarTheme: AppBarTheme(brightness: Brightness.light)
          ),
        ));
  }
}

Color mainColor = Color.fromRGBO(255, 242, 230, 1);

Map<int, Color> color = {
  50: Color.fromRGBO(4, 131, 184, .1),
  100: Color.fromRGBO(4, 131, 184, .2),
  200: Color.fromRGBO(4, 131, 184, .3),
  300: Color.fromRGBO(4, 131, 184, .4),
  400: Color.fromRGBO(4, 131, 184, .5),
  500: Color.fromRGBO(4, 131, 184, .6),
  600: Color.fromRGBO(4, 131, 184, .7),
  700: Color.fromRGBO(4, 131, 184, .8),
  800: Color.fromRGBO(4, 131, 184, .9),
  900: Color.fromRGBO(4, 131, 184, 1),
};
