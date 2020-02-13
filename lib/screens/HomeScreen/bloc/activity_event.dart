import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();
}

class FetchActivity extends ActivityEvent {
  final LatLng center;
  final double radius;
  FetchActivity([this.center, this.radius = 10]);

  @override
  List<Object> get props => [this.center, this.radius];
}

class CreateActivity extends ActivityEvent {
  final Activity activity;

  CreateActivity([this.activity]);

  @override
  List<Object> get props => [this.activity];
}
