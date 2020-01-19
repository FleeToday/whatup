import 'package:flutter/material.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesListViewWidget.dart';
import 'package:whatup/screens/HomeScreen/AppBarProfileButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesMapViewWidget.dart';
import 'package:whatup/screens/ProfileScreen/ProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
            padding: EdgeInsets.only(left: 20),
            child: AppBarProfileButtonWidget(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            )),
      ),
      drawer: ProfileScreen(),
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
