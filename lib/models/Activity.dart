import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Activity {
  String title;
  String description;
  LatLng location;
  String locationName = "locationName";
  DateTime datetime;
  DocumentReference reference;
  GeoPoint _;

  Activity() {}
  Activity.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['description'] != null),
        assert(map['location_name'] != null),
        assert(map['location'] != null),
        assert(map['datetime'] != null),
        title = map['title'],
        description = map['description'],
        location = LatLng((map['location']['geopoint'] as GeoPoint).latitude,
            (map['location']['geopoint'] as GeoPoint).longitude),
        locationName = map['location_name'],
        datetime = map['datetime'].toDate();

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
