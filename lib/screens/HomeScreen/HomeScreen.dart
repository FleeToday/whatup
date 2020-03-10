import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whatup/components/NeumorConcaveContainer.dart';
import 'package:whatup/components/NeumorConvexContainer.dart';
import 'package:whatup/components/NeumorFlatContainer.dart';
import 'package:whatup/components/ZoomScaffold.dart';
import 'package:whatup/main.dart';
import 'package:whatup/screens/ActivityCreateScreen/ActivityCreateScreen.dart';
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

import 'bloc/activity_bloc.dart';
import 'bloc/activity_event.dart';
import 'bloc/bloc.dart';
import 'widgets/ActivitiesCreateButtonWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MenuController menuController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // menuController = new MenuController(
    //   vsync: this,
    // )..addListener(() => setState(() {}));
  }

  void _onItemTapped(index) {
    if (index == 2) {
      Navigator.of(context).push(FadeRoute(page: ActivityCreateScreen()));
      return;
    }
    this.setState(() {
      _selectedIndex = index;
    });
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
        child: Scaffold(
            extendBodyBehindAppBar: true,
            bottomNavigationBar: NeumorFlatContainer(
              child: NeumorConvexContainer(
                // color: mainColor,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  color: mainColor,
                  child: Wrap(
                    children: <Widget>[
                      SafeArea(
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    this._onItemTapped(0);
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    child: this._selectedIndex != 0
                                        ? NeumorFlatContainer(
                                            child: NeumorConvexContainer(
                                              child: Icon(
                                                Icons.map,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )
                                        : NeumorConcaveContainer(
                                            horizontalStops: [
                                              0.0,
                                              0.3,
                                              0.8,
                                              0.9,
                                              1.0
                                            ],
                                            child: Icon(
                                              Icons.map,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    this._onItemTapped(1);
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    child: this._selectedIndex != 1
                                        ? NeumorFlatContainer(
                                            child: NeumorConvexContainer(
                                              child: Icon(
                                                Icons.calendar_today,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )
                                        : NeumorConcaveContainer(
                                            horizontalStops: [
                                              0.0,
                                              0.3,
                                              0.8,
                                              0.9,
                                              1.0
                                            ],
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    this._onItemTapped(2);
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    child: this._selectedIndex != 2
                                        ? NeumorFlatContainer(
                                            child: NeumorConvexContainer(
                                              child: Icon(
                                                Icons.home,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )
                                        : NeumorConcaveContainer(
                                            horizontalStops: [
                                              0.0,
                                              0.3,
                                              0.8,
                                              0.9,
                                              1.0
                                            ],
                                            child: Icon(
                                              Icons.calendar_today,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    this._onItemTapped(3);
                                  },
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    child: this._selectedIndex != 3
                                        ? NeumorFlatContainer(
                                            child: NeumorConvexContainer(
                                              child: Icon(
                                                Icons.account_box,
                                                color: Theme.of(context)
                                                    .primaryColorDark,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          )
                                        : NeumorConcaveContainer(
                                            horizontalStops: [
                                              0.0,
                                              0.3,
                                              0.8,
                                              0.9,
                                              1.0
                                            ],
                                            child: Icon(
                                              Icons.account_box,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.all(8),
                      child: AppBarMenuButtonWidget(
                        onPressed: () {
                          // menuController.toggle();
                        },
                      )),
                ]),
            // menuScreen: AppBarDrawerWidget(),
            body: _getBody()),
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return this._getHomeWidget();
      case 3:
        return this._getSettingsWidget();
    }
  }

  Widget _getHomeWidget() {
    return Stack(children: [
      ActivitiesMapViewWidget(),
      new SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              LocationSearchInputWidget(),
              // ActivityReloadButton(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ActivitiesCreateButtonWidget(
                  onPressed: () {
                    BlocProvider.of<ActivityBloc>(context).add(FetchActivity(
                        (BlocProvider.of<MapBloc>(context).state as LoadedMap)
                            .center));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                    // color: Colors.purple[200],
                    // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.purple[200].withAlpha(0),
                    //     Colors.purple[200].withAlpha(0),
                    //     Colors.purple[200].withAlpha(100),
                    //     Colors.purple[200].withAlpha(500),
                    //     Colors.purple[200]
                    //   ],
                    //   stops: [0, 0.3, 0.5, 0.7, 1],
                    // ),
                    ),
                child: ActivitiesListView(),
              )
            ],
          )
        ],
      )),
    ]);
  }

  Widget _getSettingsWidget() {
    return AppBarDrawerWidget();
  }
}
