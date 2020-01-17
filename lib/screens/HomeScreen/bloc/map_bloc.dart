import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/models/ActivityList.dart';
import 'package:whatup/resources/Repository.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final Repository _repository = Repository();

  @override
  MapState get initialState => LoadingMap();

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
    // yield LoadingMap();
    LatLng _currentLocation = await _repository.getCurrentLocation();
    ActivityList _activityList = await _repository.getActivitiesByCenter();
    yield LoadedMap("jj market", _currentLocation, _activityList);
  }

  Stream<MapState> _mapUpdateMapToState(UpdateMap event) async* {
    // yield LoadingMap();
    ActivityList _activityList = await _repository.getActivitiesByCenter();
    yield LoadedMap(event.locationName, event.center, _activityList);
  }
}
