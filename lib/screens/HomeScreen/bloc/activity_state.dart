import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/ActivityList.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();
}

class LoadingActivity extends ActivityState {
  @override
  List<Object> get props => [];
}

class LoadedActivity extends ActivityState {
  final LatLng center;
  final double radius;
  final ActivityList activityList;

  LoadedActivity([this.center, this.radius, this.activityList]);
  @override
  List<Object> get props => [this.center, this.radius, this.activityList];
}
