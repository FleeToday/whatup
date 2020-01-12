import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_event.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_state.dart';

class ActivitiesMapViewWidget extends StatelessWidget {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    mapController = controller;
    final mapBloc = BlocProvider.of<MapBloc>(context);
    mapBloc.add(UpdateMapToCurrentLocation());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is LocationSelected) {
            mapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: state.center,
              zoom: 15.0,
            )));
          }
        },
        child: GoogleMap(
          onMapCreated: (controller) => _onMapCreated(context, controller),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ));
  }
}
