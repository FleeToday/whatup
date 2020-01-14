import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_state.dart';

class ActivitiesMapViewWidget extends StatefulWidget {
  @override
  _ActivitiesMapViewWidgetState createState() =>
      _ActivitiesMapViewWidgetState();
}

class _ActivitiesMapViewWidgetState extends State<ActivitiesMapViewWidget> {
  Future<LatLng> _initialPosition;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    _initialPosition = _getUserLocation();
  }

  Future<LatLng> _getUserLocation() async {
    var _location = Location();
    var _currentLocation = await _location.getLocation();
    return LatLng(_currentLocation.latitude, _currentLocation.longitude);
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
        child: FutureBuilder(
            future: _initialPosition,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GoogleMap(
                  onMapCreated: (controller) =>
                      _onMapCreated(context, controller),
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: snapshot.data,
                    zoom: 18.0,
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
