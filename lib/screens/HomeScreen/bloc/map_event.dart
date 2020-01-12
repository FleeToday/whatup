import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class UpdateMapToCurrentLocation extends MapEvent {
  const UpdateMapToCurrentLocation();
}

class UpdateMap extends MapEvent {
  final LatLng center;

  const UpdateMap(this.center);

  @override
  List<Object> get props => [center];
}
