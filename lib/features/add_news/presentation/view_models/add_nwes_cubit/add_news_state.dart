abstract class AddNewsState {}

class AddNewsInitial extends AddNewsState {}

class AddNewsPickImageSuccess extends AddNewsState {}

class AddNewsEmit extends AddNewsState {}

class SocialGetUserLoading extends AddNewsState {}

class SocialGetUserError extends AddNewsState {
  final String errorMessage;

  SocialGetUserError(this.errorMessage);
}

class SocialGetUserSuccsess extends AddNewsState {}

class SocialCreatePostLoading extends AddNewsState {}

class SocialCreatePostSucces extends AddNewsState {}

class SocialCreatePostError extends AddNewsState {}

class SocialGetPostsLoading extends AddNewsState {}

class SocialGetPostsError extends AddNewsState {
  final String errorMessage;

  SocialGetPostsError(this.errorMessage);
}

class SocialGetPostsSuccsess extends AddNewsState {}
