import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';
import 'package:whatup/screens/LoginScreen/utils/login_validators.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  LoginBloc(this.repo);

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
