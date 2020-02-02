import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/screens/HomeScreen/bloc/map_bloc.dart';
import 'package:whatup/utilities/Debouncer.dart';
import 'bloc/bloc.dart';
import 'bloc/map_state.dart';
import 'package:flutter/services.dart' show rootBundle;

class ActivitiesMapViewWidget extends StatefulWidget {
  @override
  _ActivitiesMapViewWidgetState createState() =>
      _ActivitiesMapViewWidgetState();
}

class _ActivitiesMapViewWidgetState extends State<ActivitiesMapViewWidget> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = {};
  String _mapStyle;
  final _debouncer = Debouncer(milliseconds: 100);

  void _onMapCreated(BuildContext context, GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<MapBloc, MapState>(listener: (context, state) async {
            if (state is MovingMap) {
              final GoogleMapController controller = await _controller.future;
              controller
                  .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: state.center,
                zoom: 15.0,
              )));
              BlocProvider.of<MapBloc>(context).add(UpdateCenter(state.center));
            }
          })
        ],
        child: BlocBuilder<MapBloc, MapState>(builder: (context, mapState) {
          return BlocBuilder<ActivityBloc, ActivityState>(
            builder: (context, activityState) {
              Set<Marker> markers = Set<Marker>.of(
                  (activityState is LoadedActivity)
                      ? activityState.activityList.getMarkers().values
                      : {});
              if (mapState is LoadedMap) {
                return GoogleMap(
                  onMapCreated: (controller) =>
                      _onMapCreated(context, controller),
                  myLocationEnabled: false,
                  markers: markers,
                  onCameraMove: (CameraPosition cameraPosition) {
                    _debouncer.run(() => BlocProvider.of<MapBloc>(context)
                        .add(UpdateCenter(cameraPosition.target)));
                  },
                  initialCameraPosition: CameraPosition(
                    target: mapState.center,
                    zoom: 18.0,
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        }));
  }
}
