import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> getActivities() => _firestoreProvider.getActivities();
  Future<QuerySnapshot> getActivitiesByCenter() =>
      _firestoreProvider.getActivitiesByCenter();
  Future<void> addActivity(Activity _activity) =>
      _firestoreProvider.addActivity(_activity);

  Future<LatLng> getCurrentLocation() async {
    var _location = Location();
    var _currentLocation = await _location.getLocation();
    return LatLng(_currentLocation.latitude, _currentLocation.longitude);
  }
}
