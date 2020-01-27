import 'package:equatable/equatable.dart';
import 'package:whatup/models/UserProfile.dart';

abstract class UserProfileState extends Equatable {
  final bool isUserProfileExist;
  final bool isUserProfileCompleted;

  const UserProfileState(this.isUserProfileExist, this.isUserProfileCompleted);
}

class UserProfileRetrievalEmpty extends UserProfileState {
  const UserProfileRetrievalEmpty() : super(false, false);

  @override
  List<Object> get props => [this.isUserProfileExist];
}

class UserProfileRetrievalSuccess extends UserProfileState {
  final UserProfile currentUserProfile;
  const UserProfileRetrievalSuccess(
      this.currentUserProfile, bool isUserProfileCompleted)
      : super(currentUserProfile != null, isUserProfileCompleted);

  @override
  List<Object> get props => [this.currentUserProfile];
}

class UserProfileRetrievalFailure extends UserProfileState {
  const UserProfileRetrievalFailure() : super(false, false);

  @override
  List<Object> get props => [this.isUserProfileExist];
}

class UserProfileIncompleted extends UserProfileRetrievalSuccess {
  UserProfileIncompleted(UserProfile currentUserProfile)
      : super(currentUserProfile, false);

  @override
  List<Object> get props => [this.isUserProfileExist];
}
