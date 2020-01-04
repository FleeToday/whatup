import 'package:flutter/material.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';

class LocationSearchPopupWidget extends StatefulWidget {
  @override
  _LocationSearchPopupWidgetState createState() =>
      _LocationSearchPopupWidgetState();
}

class _LocationSearchPopupWidgetState extends State<LocationSearchPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          decoration: InputDecoration(
              border: InputBorder.none, hintText: "Where are you?"),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
