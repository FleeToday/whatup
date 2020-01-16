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
  Future<LatLng> _initialPosition;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    final mapBloc = BlocProvider.of<MapBloc>(context);
    mapBloc.add(UpdateMapToCurrentLocation());
  }

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(listener: (context, state) async {
      if (state is LocationSelected) {
        final GoogleMapController controller = await _controller.future;
        await controller
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: state.center,
          zoom: 15.0,
        )));
      }
    }, child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      if (state is LocationSelected) {
        return GoogleMap(
          onMapCreated: (controller) => _onMapCreated(context, controller),
          myLocationEnabled: true,
          markers: Set<Marker>.of(state.markers.values),
          initialCameraPosition: CameraPosition(
            target: state.center,
            zoom: 18.0,
          ),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }));
  }
}
