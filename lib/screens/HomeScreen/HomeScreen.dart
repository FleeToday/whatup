import 'package:flutter/material.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesListViewWidget.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesMapViewWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: ActivitiesCreateButtonWidget()),
        body: Stack(children: [
          ActivitiesMapViewWidget(),
          new SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LocationSearchInputWidget(),
              ActivitiesListView()
            ],
          )),
        ]));
  }
}
