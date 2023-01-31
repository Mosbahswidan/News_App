part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetTrendingLoading extends HomeState {}

class HomeGetTrendingSuccsess extends HomeState {
  final List<NewsModel> trendings;

  HomeGetTrendingSuccsess(this.trendings);
}

class HomeGetTrendingError extends HomeState {
  final String errorMessage;

  HomeGetTrendingError(this.errorMessage);
}
