import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const AuthState(this.isEmailValid, this.isPasswordValid, this.isSubmitting,
      this.isSuccess, this.isFailure);

  List<Object> get props =>
      [isEmailValid, isPasswordValid, isSubmitting, isSuccess, isFailure];
}

class AuthEmpty extends AuthState {
  const AuthEmpty() : super(true, true, false, false, false);
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(true, true, true, false, false);
}

class AuthUpdate extends AuthState {
  const AuthUpdate(isEmailValid, isPasswordValid)
      : super(isEmailValid, isPasswordValid, true, false, false);
}

class AuthSuccess extends AuthState {
  final FirebaseUser user;

  const AuthSuccess(this.user) : super(true, true, true, true, false);
}

class AuthFailure extends AuthState {
  final String errMsg;

  const AuthFailure(this.errMsg) : super(true, true, true, false, true);
}
