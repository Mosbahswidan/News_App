part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {}

class LoginSuccsess extends LoginState {
  String uId;
  LoginSuccsess(this.uId);
}
