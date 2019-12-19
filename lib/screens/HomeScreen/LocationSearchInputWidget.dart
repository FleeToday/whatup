import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationSearchInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 350,
      height: 50,
      margin: const EdgeInsets.only(top: 10.0),
      child: TextField(
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
