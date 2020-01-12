import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_event.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_state.dart';

class ActivitiesMapViewWidget extends StatefulWidget {
  @override
  _ActivitiesMapViewWidgetState createState() =>
      _ActivitiesMapViewWidgetState();
}

class _ActivitiesMapViewWidgetState extends State<ActivitiesMapViewWidget> {
  static LatLng _initialPosition;
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    print("init state");
    _getUserLocation();
  }

  _getUserLocation() async {
    var _location = Location();
    var _currentLocation = await _location.getLocation();
    setState(() {
      _initialPosition =
          LatLng(_currentLocation.latitude, _currentLocation.longitude);
    });
  }

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
        listener: (context, state) async {
          if (state is LocationSelected) {
            final GoogleMapController controller = await _controller.future;
            await controller
                .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: state.center,
              zoom: 15.0,
            )));
          }
        },
        child: GoogleMap(
          onMapCreated: (controller) => _onMapCreated(context, controller),
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 11.0,
          ),
        ));
  }
}
