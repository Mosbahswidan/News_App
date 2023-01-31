part of 'author_profile_cubit.dart';

@immutable
abstract class AuthorProfileState {}

class AuthorProfileInitial extends AuthorProfileState {}

class AuthorProfileGetNewsLoading extends AuthorProfileState {}

class AuthorProfileGetNewsSuccess extends AuthorProfileState {
  final List<NewsModel> authorNews;

  AuthorProfileGetNewsSuccess(this.authorNews);
}

class AuthorProfileGetNewsError extends AuthorProfileState {
  final String errorMessage;

  AuthorProfileGetNewsError(this.errorMessage);
}
