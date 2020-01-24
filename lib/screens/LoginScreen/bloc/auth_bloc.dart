import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/auth_state.dart';
import 'package:whatup/screens/LoginScreen/utils/login_validators.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.repo);

  final Repository repo;

  @override
  AuthState get initialState => AuthEmpty();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield AuthUpdate(Validators.isValidEmail(event.email), true);
    } else if (event is PasswordChanged) {
      yield AuthUpdate(true, Validators.isValidPassword(event.password));
    } else if (event is SignInSubmitted) {
      yield* _mapSignInSubmittedEventToStates(
          email: event.email, password: event.password);
    } else if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedEventToStates(
          email: event.email, password: event.password);
    } else if (event is SignOut) {
      yield* _mapSignOutEventToStates();
    } else if (event is CheckSignIn) {
      yield* _mapCheckSignInEventToStates();
    }
  }

  Stream<AuthState> _mapSignInSubmittedEventToStates(
      {String email, String password}) async* {
    yield AuthLoading();
    try {
      await repo.signIn(email, password);
      yield AuthSuccess();
    } catch (_) {
      yield AuthFailure(_.message);
    }
  }

  Stream<AuthState> _mapCheckSignInEventToStates() async* {
    yield AuthLoading();
    try {
      String user = await repo.getCurrentUser();
      if (user != null) {
        yield AuthSuccess();
      } else {
        yield AuthEmpty();
      }
    } catch (_) {
      yield AuthEmpty();
    }
  }

  Stream<AuthState> _mapSignUpSubmittedEventToStates(
      {String email, String password}) async* {
    yield AuthLoading();
    try {
      await repo.signUp(email, password);
      yield AuthSuccess();
    } catch (_) {
      yield AuthFailure(_.message);
    }
  }

  Stream<AuthState> _mapSignOutEventToStates() async* {
    yield AuthLoading();
    try {
      await repo.signOut();
      yield AuthEmpty();
    } catch (_) {
      yield AuthEmpty();
    }
  }
}
