import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../resources/Repository.dart';
import 'UserProfile.dart';
import 'UserProfile.dart';

class Activity {
  String title;
  String description;
  LatLng location;
  String locationName = "locationName";
  DateTime datetime;
  DocumentReference reference;
  List<UserProfile> members;
  GeoPoint _;

  Activity() {
    members = [];
  }

  Activity.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        // assert(map['members'] != null),
        assert(map['description'] != null),
        assert(map['location_name'] != null),
        assert(map['location'] != null),
        assert(map['datetime'] != null),
        title = map['title'],
        members = map['members'] != null
            ? (map['members'] as List<dynamic>)
                .map((e) => UserProfile.fromMap(e as Map<dynamic, dynamic>))
                .toList()
            : [],
        description = map['description'],
        location = LatLng((map['location']['geopoint'] as GeoPoint).latitude,
            (map['location']['geopoint'] as GeoPoint).longitude),
        locationName = map['location_name'],
        datetime = map['datetime'].toDate();

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
