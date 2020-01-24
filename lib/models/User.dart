import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> interests;
  DocumentReference reference;

  User({this.id, this.firstName, this.lastName, this.email, this.interests});
  User.fromMap(Map<String, dynamic> map, {reference})
      : assert(map['firstName'] != null),
        assert(map['lastName'] != null),
        assert(map['interests'] != null),
        assert(map['id'] != null),
        assert(map['email'] != null),
        firstName = map['firstName'],
        lastName = map['lastName'],
        interests = map['interests'],
        id = map['id'],
        email = map['email'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

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
