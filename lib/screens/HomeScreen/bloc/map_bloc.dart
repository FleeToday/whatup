import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/Repository.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final Repository _repository = Repository();

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

  //todo: should put this function to a seperate class
  Future<Map<MarkerId, Marker>> getMarkers() async {
    QuerySnapshot _snapshot = await _repository.getActivitiesByCenter();
    List<Activity> _activities = _snapshot.documents
        .map((_data) => Activity.fromSnapshot(_data))
        .toList();
    int _markerIdCounter = 1;
    Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
    _activities.forEach((_activity) {
      final String markerIdVal = 'marker_id_$_markerIdCounter';
      _markerIdCounter++;
      final MarkerId markerId = MarkerId(markerIdVal);
      final Marker marker = Marker(
        markerId: markerId,
        position: _activity.location,
      );
      _markers[markerId] = marker;
    });
    return _markers;
  }

  Stream<MapState> _mapUpdateMapToCurrentLocationToState(
      UpdateMapToCurrentLocation event) async* {
    LatLng _currentLocation = await _repository.getCurrentLocation();
    Map<MarkerId, Marker> _markers = await getMarkers();
    yield LocationSelected("jj market", _currentLocation, _markers);
  }

  Stream<MapState> _mapUpdateMapToState(UpdateMap event) async* {
    Map<MarkerId, Marker> _markers = await getMarkers();
    yield LocationSelected(event.locationName, event.center, _markers);
  }
}
