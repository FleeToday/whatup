import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatup/models/Activity.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<void> addActivity(Activity _activity) async {
    return _firestore.collection("activities").add({
      'title': _activity.title,
      'description': _activity.description,
      'location': {
        'lat': _activity.location.latitude,
        'lng': _activity.location.longitude
      }
    });
  }

  Stream<QuerySnapshot> getActivities() {
    return _firestore.collection('activities').snapshots();
  }

  Future<QuerySnapshot> getActivitiesByCenter() {
    return _firestore.collection('activities').getDocuments();
  }
}
