import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/HomeScreen/AppBarDrawerWidget.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityReloadButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesListViewWidget.dart';
import 'package:whatup/screens/HomeScreen/AppBarProfileButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesMapViewWidget.dart';
import 'package:whatup/screens/LoginScreen/LoginScreen.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';

import 'bloc/bloc.dart';

class HomeScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthEmpty) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: Scaffold(
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
        drawer: AppBarDrawerWidget(),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: ActivitiesCreateButtonWidget()),
        body: Stack(children: [
          ActivitiesMapViewWidget(),
          new SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  LocationSearchInputWidget(),
                  BlocBuilder<MapBloc, MapState>(
                    builder: (context, state) {
                      return AnimatedOpacity(
                        // If the widget is visible, animate to 0.0 (invisible).
                        // If the widget is hidden, animate to 1.0 (fully visible).
                        opacity: (state is LoadedMap) ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 100),
                        // The green box must be a child of the AnimatedOpacity widget.
                        child: ActivityReloadButton(),
                      );
                    },
                  )
                ],
              ),
              ActivitiesListView()
            ],
          )),
        ]),
      ),
    );
  }
}
