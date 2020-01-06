import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/FirestoreProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> getActivities() => _firestoreProvider.getActivities();
  Future<void> addActivity(Activity _activity) =>
      _firestoreProvider.addActivity(_activity);
}
