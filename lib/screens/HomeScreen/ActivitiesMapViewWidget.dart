import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'bloc/bloc.dart';
import 'bloc/map_state.dart';

LatLngBounds a;

class ActivitiesMapViewWidget extends StatefulWidget {
  @override
  _ActivitiesMapViewWidgetState createState() =>
      _ActivitiesMapViewWidgetState();
}

class _ActivitiesMapViewWidgetState extends State<ActivitiesMapViewWidget> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = {};

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final ActivityBloc activityBloc = BlocProvider.of<ActivityBloc>(context);
    return MultiBlocListener(
        listeners: [
          BlocListener<MapBloc, MapState>(listener: (context, state) async {
            if (state is LoadedMap) {
              final GoogleMapController controller = await _controller.future;
              await controller
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: state.center,
                zoom: 15.0,
              )));
            }
          }),
          BlocListener<ActivityBloc, ActivityState>(
              listener: (context, state) async {
            if (state is LoadedActivity) {
              setState(() {
                this.markers = state.activityList.getMarkers();
              });
            }
          }),
        ],
        child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          if (state is LoadedMap) {
            return GoogleMap(
              onMapCreated: (controller) => _onMapCreated(context, controller),
              myLocationEnabled: true,
              markers: Set<Marker>.of(this.markers.values),
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
