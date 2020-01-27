import 'package:equatable/equatable.dart';

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

class RemoveUserProfile extends UserProfileEvent {
  const RemoveUserProfile();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'RemoveUserProfile { }';
  }
}
