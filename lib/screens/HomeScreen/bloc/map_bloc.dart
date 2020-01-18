import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/resources/Repository.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final Repository _repository = Repository();
  final ActivityBloc activityBloc;

  MapBloc({@required this.activityBloc}) {
    activityBloc.listen((state) {
      if (state is LoadedActivity) {
        add(UpdateActivity((state as LoadedActivity).activityList));
      }
    });
  }
  @override
  MapState get initialState => LoadingMap();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is UpdateActivity) {
      yield* _mapUpdateActivityToState(event);
    } else if (event is FocusMap) {
      yield* _mapFocusMapToState(event);
    } else if (event is UpdateMapToCurrentLocation) {
      yield* _mapUpdateMapToCurrentLocationToState(event);
    }
  }

  Stream<MapState> _mapFocusMapToState(FocusMap event) async* {
    yield LoadedMap(
        event.locationName, event.center, (state as LoadedMap).activityList);
  }

  Stream<MapState> _mapUpdateMapToCurrentLocationToState(
      UpdateMapToCurrentLocation event) async* {
    LatLng _currentLocation = await _repository.getCurrentLocation();
    if (state is LoadedMap) {
      yield LoadedMap(
          "location name", _currentLocation, (state as LoadedMap).activityList);
    } else {
      yield LoadingActivityMap("location name", _currentLocation);
    }
  }

  Stream<MapState> _mapUpdateActivityToState(UpdateActivity event) async* {
    if (state is LoadingActivityMap) {
      yield LoadedMap((state as LoadingActivityMap).locationName,
          (state as LoadingActivityMap).center, event.activityList);
    } else if (state is LoadedMap) {
      yield LoadedMap((state as LoadedMap).locationName,
          (state as LoadedMap).center, event.activityList);
    }
  }
}
