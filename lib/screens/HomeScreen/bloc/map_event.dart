import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/ActivityList.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class UpdateActivity extends MapEvent {
  final ActivityList activityList;

  const UpdateActivity([this.activityList]);
}

class UpdateMapToCurrentLocation extends MapEvent {
  const UpdateMapToCurrentLocation();
}

class FocusMap extends MapEvent {
  final String locationName;
  final LatLng center;

  const FocusMap(this.locationName, this.center);

  @override
  List<Object> get props => [this.locationName, this.center];
}
