import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatup/models/Hobby.dart';

class UserProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<Hobby> hobbies;
  DocumentReference reference;

  UserProfile(
      {this.id, this.firstName, this.lastName, this.email, this.hobbies});
  UserProfile.fromMap(Map<String, dynamic> map, {reference})
      : firstName = map['firstName'],
        lastName = map['lastName'],
        hobbies = map['hobbies'] != null
            ? (map['hobbies'] as List<dynamic>)
                .map((e) => Hobby.fromMap(e as Map<dynamic, dynamic>))
                .toList()
            : [],
        id = map['id'],
        email = map['email'];

  UserProfile.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  static bool isCompleted(UserProfile userProfile) {
    return userProfile.hobbies != null &&
        userProfile.lastName != null &&
        userProfile.firstName != null &&
        userProfile.id != null &&
        userProfile.email != null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'hobbies': hobbies.map((e) => e.toJson()).toList(),
    };
  }
}
