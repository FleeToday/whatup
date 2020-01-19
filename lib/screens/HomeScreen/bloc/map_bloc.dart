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
    if (event is UpdateActivity) {
      yield* _mapUpdateActivityToState(event);
    } else if (event is FocusMap) {
      yield* _mapFocusMapToState(event);
    } else if (event is UpdateMapToCurrentLocation) {
      yield* _mapUpdateMapToCurrentLocationToState(event);
    }
  }

  Stream<MapState> _mapFocusMapToState(FocusMap event) async* {
    // activityBloc.add(FetchActivity(event.center));
    yield LoadedMap("location", event.center);
  }

  Stream<MapState> _mapUpdateMapToCurrentLocationToState(
      UpdateMapToCurrentLocation event) async* {
    LatLng _currentLocation = await _repository.getCurrentLocation();
    // activityBloc.add(FetchActivity(_currentLocation));
    yield LoadedMap("location", _currentLocation);
  }

  Stream<MapState> _mapUpdateActivityToState(UpdateActivity event) async* {
    if (state is LoadedMap) {
      yield LoadedMap(
          (state as LoadedMap).locationName, (state as LoadedMap).center);
    }
  }
}
