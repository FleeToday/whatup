import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/resources/Repository.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final Repository _repository = Repository();
  final ActivityBloc activityBloc;

  MapBloc({@required this.activityBloc}) {}

  @override
  MapState get initialState => LoadingMap();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is UpdateCenter) {
      yield LoadedMap(event.center);
    } else if (event is MoveCamera) {
      yield MovingMap(event.center);
      yield LoadedMap(event.center);
    } else if (event is ResetCamera) {
      LatLng _currentLocation = await _repository.getCurrentLocation();
      activityBloc.add(FetchActivity(_currentLocation));
      yield LoadedMap(_currentLocation);
    }
  }
}
