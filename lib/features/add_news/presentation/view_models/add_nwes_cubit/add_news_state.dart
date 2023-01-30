part of 'add_news_cubit.dart';

@immutable
abstract class AddNewsState {}

class AddNewsInitial extends AddNewsState {}

class AddNewsPickImageSuccess extends AddNewsState {}

class AddNewsEmit extends AddNewsState {}
