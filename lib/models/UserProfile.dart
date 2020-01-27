import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> interests;
  DocumentReference reference;

  UserProfile(
      {this.id, this.firstName, this.lastName, this.email, this.interests});
  UserProfile.fromMap(Map<String, dynamic> map, {reference})
      : firstName = map['firstName'],
        lastName = map['lastName'],
        interests = map['interests'],
        id = map['id'],
        email = map['email'];

  UserProfile.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  static bool isCompleted(UserProfile userProfile) {
    return userProfile.interests != null &&
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
      'interests': interests,
    };
  }
}
