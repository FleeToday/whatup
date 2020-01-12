import 'package:bloc/bloc.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_event.dart';
import 'package:whatup/screens/LoginScreen/bloc/login_state.dart';
import 'package:whatup/screens/LoginScreen/utils/login_validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginEmpty();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is EmailChanged) {
      yield LoginUpdate(Validators.isValidEmail(event.email), true);
    } else if (event is PasswordChanged) {
      yield LoginUpdate(true, Validators.isValidPassword(event.password));
    }
  }
}
