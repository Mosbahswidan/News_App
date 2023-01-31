import 'package:news_app/features/search/data/models/search_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetTrendingLoading extends HomeState {}

class HomeGetTrendingSuccsess extends HomeState {
  final List<News> trendings;

  HomeGetTrendingSuccsess(this.trendings);
}

class HomeGetTrendingError extends HomeState {
  final String errorMessage;

  HomeGetTrendingError(this.errorMessage);
}

class HomeGetAllLoading extends HomeState {}

class HomeGetAllSuccsess extends HomeState {
  final List<News> allNews;

  HomeGetAllSuccsess(this.allNews);
}

class HomeGetAllError extends HomeState {
  final String errorMessage;

  HomeGetAllError(this.errorMessage);
}

class HomeGetSportsLoading extends HomeState {}

class HomeGetSportsSuccsess extends HomeState {
  final List<News> sportsNews;

  HomeGetSportsSuccsess(this.sportsNews);
}

class HomeGetSportsError extends HomeState {
  final String errorMessage;

  HomeGetSportsError(this.errorMessage);
}

//politics
class HomeGetPoliticLoading extends HomeState {}

class HomeGetPoliticSuccess extends HomeState {
  final List<News> politicsNews;

  HomeGetPoliticSuccess(this.politicsNews);
}

class HomeGetPoliticError extends HomeState {
  final String errorMessage;

  HomeGetPoliticError(this.errorMessage);
}
//business

class HomeGetBusinessLoading extends HomeState {}

class HomeGetBusinessSuccess extends HomeState {
  final List<News> businessNews;

  HomeGetBusinessSuccess(this.businessNews);
}

class HomeGetBusinessError extends HomeState {
  final String errorMessage;

  HomeGetBusinessError(this.errorMessage);
}

//health
class HomeGetHealthLoading extends HomeState {}

class HomeGetHealthSuccess extends HomeState {
  final List<News> healthNews;

  HomeGetHealthSuccess(this.healthNews);
}

class HomeGetHealthEror extends HomeState {
  final String errorMessage;

  HomeGetHealthEror(this.errorMessage);
}
