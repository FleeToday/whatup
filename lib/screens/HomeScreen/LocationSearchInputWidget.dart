import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchPopupWidget.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}

class LocationSearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 350,
      height: 50,
      margin: const EdgeInsets.only(top: 10.0),
      child: TextField(
        onTap: () {
          debugPrint("tap jor");
          // Todo: Custom Animated transition with named route?
          Navigator.push(context, FadeRoute(page: LocationSearchPopupWidget()));
        },
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(25.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search Location',
          prefixIcon: Icon(
            Icons.pin_drop,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
