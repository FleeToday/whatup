import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/models/ActivityList.dart';
import 'package:whatup/resources/FirestoreProvider.dart';
import 'package:whatup/resources/UserProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _userProvider = UserProvider(firebaseAuth: FirebaseAuth.instance);

  Stream<QuerySnapshot> getActivities() => _firestoreProvider.getActivities();

  Future<ActivityList> getActivitiesByCenter(
      LatLng center, double radius) async {
    ActivityList activityList = await _firestoreProvider
        .streamActivitiesByCenter(center, radius)
        .first
        .then((snapshots) {
      return ActivityList.fromSnapshotList(snapshots);
    }).catchError((err) {
      print(err);
    });
    return activityList;
  }

  Stream<ActivityList> getActivitiesStreamByCenter(
      LatLng center, double radius) {
    Stream<List<DocumentSnapshot>> stream =
        _firestoreProvider.streamActivitiesByCenter(center, radius);
    return stream.map((data) {
      return ActivityList.fromSnapshotList(data);
    });
  }

  Future<void> addActivity(Activity _activity) =>
      _firestoreProvider.addActivity(_activity);

  Future<LatLng> getCurrentLocation() async {
    var _location = Location();
    var isLocationPermitted = await _location.requestPermission();
    var _currentLocation = await _location.getLocation();
    return LatLng(_currentLocation.latitude, _currentLocation.longitude);
  }

  Future<AuthResult> signIn(String email, String password) =>
      _userProvider.signInWithCredentials(email: email, password: password);

  Future<void> signOut() => _userProvider.signUp();

  Future<AuthResult> signUp(String email, String password) =>
      _userProvider.signUp(email: email, password: password);
}
