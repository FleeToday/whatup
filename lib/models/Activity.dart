import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Activity {
  String title;
  String description;
  LatLng location;
  DocumentReference reference;

  Activity() {}
  Activity.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['description'] != null),
        assert(map['location'] != null),
        title = map['title'],
        description = map['description'],
        location = LatLng(map['location']['lat'], map['location']['lng']);

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
