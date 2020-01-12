import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const LoginState(this.isEmailValid, this.isPasswordValid, this.isSubmitting,
      this.isSuccess, this.isFailure);

  List<Object> get props =>
      [isEmailValid, isPasswordValid, isSubmitting, isSuccess, isFailure];
}

class LoginEmpty extends LoginState {
  const LoginEmpty() : super(true, true, false, false, false);
}

class LoginLoading extends LoginState {
  const LoginLoading() : super(true, true, true, false, false);
}

class LoginUpdate extends LoginState {
  const LoginUpdate(isEmailValid, isPasswordValid)
      : super(isEmailValid, isPasswordValid, true, false, false);
}

class LoginSuccess extends LoginState {
  const LoginSuccess() : super(true, true, true, true, false);
}

class LoginFailure extends LoginState {
  final String errMsg;

  const LoginFailure(this.errMsg) : super(true, true, true, false, true);
}
