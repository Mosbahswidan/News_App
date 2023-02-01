abstract class BookMarkState {}

class BookMarkInitial extends BookMarkState {}

class BookMarkAddedLoading extends BookMarkState {}

class BookMarkAddedSuccess extends BookMarkState {}

class BookMarkAddedError extends BookMarkState {
  String error;
  BookMarkAddedError(this.error);
}
