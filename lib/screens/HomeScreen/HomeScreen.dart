import 'package:flutter/material.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesListViewWidget.dart';
import 'package:whatup/screens/HomeScreen/AppBarProfileButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesMapViewWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
              padding: EdgeInsets.only(right: 20),
              child: AppBarProfileButtonWidget()
            )
        ],
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 230),
          child: ActivitiesCreateButtonWidget()),
      body: Stack(children: [
        ActivitiesMapViewWidget(),
        new SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[LocationSearchInputWidget(), ActivitiesListView()],
        )),
      ]),
    );
  }
}
