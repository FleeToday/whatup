import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final LatLng center;

  const LocationSelected([this.center]);

  @override
  List<Object> get props => [center];
}
