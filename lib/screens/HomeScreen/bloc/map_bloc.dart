import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMapState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is UpdateMap) {
      yield* _mapUpdateMapToState(event);
    } else if (event is UpdateMapToCurrentLocation) {
      yield* _mapUpdateMapToCurrentLocationToState(event);
    }
  }

  Stream<MapState> _mapUpdateMapToCurrentLocationToState(
      UpdateMapToCurrentLocation event) async* {
    var _location = Location();
    var _currentLocation = await _location.getLocation();
    final LatLng _center =
        LatLng(_currentLocation.latitude, _currentLocation.longitude);
    yield LocationSelected(_center);
  }

  Stream<MapState> _mapUpdateMapToState(UpdateMap event) async* {
    yield LocationSelected(event.center);
  }
}
