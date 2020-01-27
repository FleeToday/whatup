import 'package:equatable/equatable.dart';
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
  final String email;
  final List<String> interests;

  CreateUserProfile(
      {this.firstName, this.lastName, this.email, this.interests});

  @override
  List<Object> get props =>
      [this.firstName, this.lastName, this.email, this.interests];

  @override
  String toString() {
    return 'CreateUserProfile { firstName: $firstName, lastName: $lastName, email: $email, interests: $interests }';
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
