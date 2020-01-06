import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  String title;
  String description;
  DocumentReference reference;

  Activity() {}
  Activity.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['description'] != null),
        title = map['title'],
        description = map['description'];

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
