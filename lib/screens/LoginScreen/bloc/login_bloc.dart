import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatup/resources/Repository.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';
import 'package:whatup/screens/LoginScreen/utils/login_validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.repo);

  final Repository repo;

  @override
  LoginState get initialState => LoginEmpty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield LoginUpdate(Validators.isValidEmail(event.email), true);
    } else if (event is PasswordChanged) {
      yield LoginUpdate(true, Validators.isValidPassword(event.password));
    } else if (event is Submitted) {
      yield* _mapSubmittedEventToStates(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _mapSubmittedEventToStates(
      {String email, String password}) async* {
    yield LoginLoading();
    try {
      await repo.signIn(email, password);
      yield LoginSuccess();
    } catch (_) {
      yield LoginFailure(_.message);
    }
  }
}
