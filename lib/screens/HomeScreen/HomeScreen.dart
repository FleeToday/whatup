import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whatup/components/ZoomScaffold.dart';
import 'package:whatup/screens/HomeScreen/AppBarDrawerWidget.dart';
import 'package:whatup/screens/HomeScreen/AppBarMenuButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivitiesCreateButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/widgets/ActivityReloadButtonWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesListViewWidget.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchInputWidget.dart';
import 'package:whatup/screens/HomeScreen/ActivitiesMapViewWidget.dart';
import 'package:whatup/screens/LoginScreen/LoginScreen.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthEmpty) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      },
      child: ChangeNotifierProvider.value(
        value: menuController,
        child: ZoomScaffold(
          floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 230),
              child: ActivitiesCreateButtonWidget()),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
                padding: EdgeInsets.only(left: 20),
                child: AppBarMenuButtonWidget(
                  onPressed: () {
                    menuController.toggle();
                  },
                )),
          ),
          menuScreen: AppBarDrawerWidget(),
          contentScreen: Layout(
            contentBuilder: (context) => Stack(children: [
              ActivitiesMapViewWidget(),
              new SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      LocationSearchInputWidget(),
                      ActivityReloadButton(),
                    ],
                  ),
                  ActivitiesListView()
                ],
              )),
            ]),
          ),
        ),
      ),
    );
    // Scaffold(
    //   key: _scaffoldKey,
    //   extendBodyBehindAppBar: true,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     leading: Container(
    //         padding: EdgeInsets.only(left: 20),
    //         child: AppBarProfileButtonWidget(
    //           onPressed: () {
    //             _scaffoldKey.currentState.openDrawer();
    //           },
    //         )),
    //   ),
    //   drawer: AppBarDrawerWidget(),
    //   floatingActionButton: Padding(
    //       padding: const EdgeInsets.only(bottom: 230),
    //       child: ActivitiesCreateButtonWidget()),
    //   body: Stack(children: [
    //     ActivitiesMapViewWidget(),
    //     new SafeArea(
    //         child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Column(
    //           children: <Widget>[
    //             LocationSearchInputWidget(),
    //             ActivityReloadButton(),
    //           ],
    //         ),
    //         ActivitiesListView()
    //       ],
    //     )),
    //   ]),
    // ),
    // );
  }
}
