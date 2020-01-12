import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatup/models/Activity.dart';
import 'package:whatup/resources/FirestoreProvider.dart';
import 'package:whatup/resources/UserProvider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _userProvider = UserProvider(firebaseAuth: FirebaseAuth.instance);

  Stream<QuerySnapshot> getActivities() => _firestoreProvider.getActivities();

  Future<void> addActivity(Activity _activity) =>
      _firestoreProvider.addActivity(_activity);

  Future<AuthResult> signIn(String email, String password) =>
      _userProvider.signInWithCredentials(email: email, password: password);

  Future<void> signOut() => _userProvider.signUp();

  Future<AuthResult> signUp(String email, String password) =>
      _userProvider.signUp(email: email, password: password);
}
