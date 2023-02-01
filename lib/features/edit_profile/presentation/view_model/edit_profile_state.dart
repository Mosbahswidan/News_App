abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileError extends EditProfileState {
  String error;
  EditProfileError(this.error);
}
