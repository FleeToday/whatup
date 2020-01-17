import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/ActivityList.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class InitialMapState extends MapState {
  final LatLng center = const LatLng(45.521563, -122.677433);

  const InitialMapState();

  @override
  List<Object> get props => [center];
}

class LoadingMap extends MapState {
  const LoadingMap();
}

class LoadedMap extends MapState {
  final String locationName;
  final LatLng center;
  final ActivityList activityList;

  const LoadedMap([this.locationName, this.center, this.activityList]);

  @override
  List<Object> get props => [this.locationName, this.center, this.activityList];
}
