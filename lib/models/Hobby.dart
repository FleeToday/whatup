import 'package:cloud_firestore/cloud_firestore.dart';

class Hobby {
  final String id;
  final String name;
  final String category;
  final DocumentReference reference;

  Hobby(this.id, this.name, this.category, this.reference);

  Hobby.fromMap(Map<String, dynamic> map, {this.reference})
      : id = map['id'],
        name = map['name'],
        category = map['category'];

  
  UserProfile.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  }
}
