import 'package:equatable/equatable.dart';
import 'package:flutter/semantics.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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

class LocationSelected extends MapState {
  final String locationName;
  final LatLng center;
  final Map<MarkerId, Marker> markers;

  const LocationSelected([this.locationName, this.center, this.markers]);

  @override
  List<Object> get props => [this.locationName, this.center, this.markers];
}