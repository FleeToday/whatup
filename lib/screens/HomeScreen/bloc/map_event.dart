import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/ActivityList.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class ResetCamera extends MapEvent {
  const ResetCamera();
}

class MoveCamera extends MapEvent {
  final LatLng center;
  const MoveCamera([this.center]);

  @override
  List<Object> get props => [this.center];
}

class UpdateCenter extends MapEvent {
  final LatLng center;
  const UpdateCenter([this.center]);

  @override
  List<Object> get props => [this.center];
}
