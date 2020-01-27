import 'package:equatable/equatable.dart';
import 'package:whatup/models/UserProfile.dart';

abstract class UserProfileState extends Equatable {
  final bool isUserProfileExist;

  const UserProfileState(this.isUserProfileExist);
}

class UserProfileRetrievalEmpty extends UserProfileState {
  const UserProfileRetrievalEmpty() : super(false);

  @override
  List<Object> get props => [this.isUserProfileExist];
}

class UserProfileRetrievalSuccess extends UserProfileState {
  final UserProfile currentUserProfile;
  const UserProfileRetrievalSuccess(this.currentUserProfile)
      : super(currentUserProfile != null);

  @override
  List<Object> get props => [this.currentUserProfile];
}

class UserProfileRetrievalFailure extends UserProfileState {
  const UserProfileRetrievalFailure() : super(false);

  @override
  List<Object> get props => [this.isUserProfileExist];
}
