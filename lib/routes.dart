import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchPopupWidget.dart';
import 'package:whatup/screens/HomeScreen/HomeScreen.dart';
import 'package:whatup/screens/ActivityCreateScreen/ActivityCreateScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/search_location": (BuildContext context) => LocationSearchPopupWidget(),
  "/create": (BuildContext context) => ActivityCreateScreen(),
};
