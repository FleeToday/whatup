import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatup/screens/HomeScreen/LocationSearchPopupWidget.dart';

import 'bloc/map_bloc.dart';
import 'bloc/map_state.dart';

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
  final _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
        listener: (context, state) async {
          if (state is LoadedMap) {
            _locationController.value =
                _locationController.value.copyWith(text: state.locationName);
          }
        },
        child: Container(
            width: 350,
            height: 50,
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: _locationController,
              onTap: () {
                // Todo: Custom Animated transition with named route?
                Navigator.push(
                    context, FadeRoute(page: LocationSearchPopupWidget()));
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
            )));
  }
}
