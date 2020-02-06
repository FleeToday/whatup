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
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // menuController = new MenuController(
    //   vsync: this,
    // )..addListener(() => setState(() {}));
  }

  void _onItemTapped(index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/create');
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
            // floatingActionButton: Padding(
            //     padding: const EdgeInsets.only(bottom: 230),
            //     child: ActivitiesCreateButtonWidget()),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  title: Text('New Activity'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).primaryColor,
              onTap: this._onItemTapped,
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
      case 2:
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
              ActivityReloadButton(),
            ],
          ),
          ActivitiesListView()
        ],
      )),
    ]);
  }

  Widget _getSettingsWidget() {
    return AppBarDrawerWidget();
  }
}
