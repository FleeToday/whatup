import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Hobby extends Equatable {
  final String id;
  final String name;
  final String category;
  final DocumentReference reference;

  Hobby(this.id, this.name, this.category, this.reference);

  Hobby.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : id = map['id'],
        name = map['name'],
        category = map['category'];

  Hobby.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'category': category};
  }

  @override
  // TODO: implement props
  List<Object> get props => [this.id, this.name];
}
