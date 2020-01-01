import 'package:flutter/widgets.dart';
import 'package:whatup/screens/LoginScreen/LoginScreen.dart';
import 'screens/HomeScreen/HomeScreen.dart';
import 'screens/ActivityCreateScreen/ActivityCreateScreen.dart';

// import 'package:example/screens/example2/examplescreen2.dart';
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/": (BuildContext context) => HomeScreen(),
  "/create": (BuildContext context) => ActivityCreateScreen(),
};
