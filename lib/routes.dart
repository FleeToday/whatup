import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatup/screens/LoginScreen/LoginScreen.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchPopupWidget.dart';
import 'package:whatup/screens/HomeScreen/HomeScreen.dart';
import 'package:whatup/screens/ActivityCreateScreen/ActivityCreateScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/": (BuildContext context) => HomeScreen(),
  "/search_location": (BuildContext context) => LocationSearchPopupWidget(),
  "/create": (BuildContext context) => ActivityCreateScreen(),
};
