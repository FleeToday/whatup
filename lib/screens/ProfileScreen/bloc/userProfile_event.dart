import 'package:equatable/equatable.dart';
import 'package:whatup/models/Hobby.dart';
import 'package:whatup/models/UserProfile.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();
}

class RetrieveUserProfile extends UserProfileEvent {
  final String uid;

  const RetrieveUserProfile(this.uid);

  @override
  List<Object> get props => [this.uid];

  @override
  String toString() {
    return 'RetrieveUserProfile { uid: $uid }';
  }
}

class CreateUserProfile extends UserProfileEvent {
  final String firstName;
  final String lastName;
  final List<Hobby> hobbies;

  CreateUserProfile({this.firstName, this.lastName, this.hobbies});

  @override
  List<Object> get props => [this.firstName, this.lastName, this.hobbies];

  @override
  String toString() {
    return 'CreateUserProfile { firstName: $firstName, lastName: $lastName, hobbies: $hobbies }';
  }
}

class RemoveUserProfile extends UserProfileEvent {
  const RemoveUserProfile();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'RemoveUserProfile { }';
  }
}
