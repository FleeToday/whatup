import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/models/User.dart';

class FirestoreProvider {
  Geoflutterfire geo = Geoflutterfire();
  static Firestore _firestore = Firestore.instance;
  final CollectionReference activitiesRef = _firestore.collection('activties');
  final CollectionReference usersRef = _firestore.collection('users');

  Future<void> addActivity(Activity _activity) async {
    GeoFirePoint _location = geo.point(
        latitude: _activity.location.latitude,
        longitude: _activity.location.longitude);
    return _firestore.collection("activities").add({
      'title': _activity.title,
      'description': _activity.description,
      'location': _location.data
    });
  }

  Stream<QuerySnapshot> getActivities() {
    return activitiesRef.snapshots();
  }

  Stream<List<DocumentSnapshot>> streamActivitiesByCenter(
      LatLng center, double radius) {
    GeoFirePoint _center =
        geo.point(latitude: center.latitude, longitude: center.longitude);
    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: _firestore.collection('activities'))
        .within(center: _center, radius: radius, field: 'location');
    return stream;
  }

  // User Collection
  Future<void> addUser(User _user) async {
    return _firestore
        .collection("user")
        .document(_user.id)
        .setData(_user.toJson());
  }

  Future<bool> checkUserExistsById(String id) async {
    DocumentSnapshot docSnapshot =
        await _firestore.collection("user").document(id).get();
    return docSnapshot.exists;
  }
}
