import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Activity.dart';

class ActivityList {
  List<Activity> items;

  ActivityList.fromSnapshotList(List<DocumentSnapshot> snapshots) {
    this.items =
        snapshots.map((_data) => Activity.fromSnapshot(_data)).toList();
  }

  ActivityList.fromSnapshot(QuerySnapshot snapshot) {
    this.items = snapshot.documents
        .map((_data) => Activity.fromSnapshot(_data))
        .toList();
  }
  Map<MarkerId, Marker> getMarkers() {
    int _markerIdCounter = 1;
    Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
    items.forEach((_activity) {
      final String markerIdVal = 'marker_id_$_markerIdCounter';
      _markerIdCounter++;
      final MarkerId markerId = MarkerId(markerIdVal);
      final Marker marker = Marker(
        markerId: markerId,
        position: _activity.location,
      );
      _markers[markerId] = marker;
    });
    return _markers;
  }
}
