part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupError extends SignupState {
  final String errorMessage;

  SignupError(this.errorMessage);
}

class SignupSuccess extends SignupState {}

class CreateUserSucsses extends SignupState {}

class CreateUserError extends SignupState {
  final String errorMessage;

  CreateUserError(this.errorMessage);
}
