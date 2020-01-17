import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_event.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_state.dart';

class ActivitiesMapViewWidget extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(listener: (context, state) async {
      if (state is LoadedMap) {
        final GoogleMapController controller = await _controller.future;
        await controller
            .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: state.center,
          zoom: 15.0,
        )));
      }
    }, child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
      if (state is LoadedMap) {
        return GoogleMap(
          onMapCreated: (controller) => _onMapCreated(context, controller),
          myLocationEnabled: true,
          markers: Set<Marker>.of(state.activityList.getMarkers().values),
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
