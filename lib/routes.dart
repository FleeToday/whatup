import 'package:flutter/widgets.dart';
import 'screens/HomeScreen/HomeScreen.dart';
import 'screens/ActivityCreateScreen/ActivityCreateScreen.dart';

// import 'package:example/screens/example2/examplescreen2.dart';
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/create": (BuildContext context) => ActivityCreateScreen(),
};
