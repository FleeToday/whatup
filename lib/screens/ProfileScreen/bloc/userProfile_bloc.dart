import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatup/models/UserProfile.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_event.dart';
import 'package:whatup/screens/ProfileScreen/bloc/userProfile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final Repository repo;

  UserProfileBloc(this.repo);

  @override
  UserProfileState get initialState => UserProfileRetrievalEmpty();

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is CreateUserProfile) {
      yield* _mapCreateUserProfileEventToState(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          interests: event.interests);
    } else if (event is RetrieveUserProfile) {
      yield* _mapRetrieveUserProfileEventToState();
    } else if (event is RemoveUserProfile) {
      yield UserProfileRetrievalEmpty();
    }
  }

  Stream<UserProfileState> _mapRetrieveUserProfileEventToState() async* {
    FirebaseUser user = await repo.getCurrentFirebaseUser();
    bool isUserProfileExist = await repo.checkUserProfileExistById(user.uid);
    if (!isUserProfileExist) {
      yield UserProfileRetrievalFailure();
    } else {
      UserProfile userProfile = await repo.getUserProfileById(user.uid);
      if (userProfile == null) {
        yield UserProfileRetrievalFailure();
      }
      yield UserProfileRetrievalSuccess(userProfile);
    }
  }

  Stream<UserProfileState> _mapCreateUserProfileEventToState(
      {String firstName,
      String lastName,
      String email,
      List<String> interests}) async* {
    FirebaseUser user = await repo.getCurrentFirebaseUser();
    UserProfile userProfile = UserProfile(
        id: user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        interests: interests);
    await repo.addUserProfile(userProfile);
    if (userProfile == null) {
      yield UserProfileRetrievalFailure();
    } else {
      yield UserProfileRetrievalSuccess(userProfile);
    }
  }
}