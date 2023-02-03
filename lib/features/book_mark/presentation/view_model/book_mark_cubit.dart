import 'package:news_app/core/utils/chach_helper.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/core/utils/firestore_services.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitial());

  static BookMarkCubit get(context) => BlocProvider.of(context);
  FirestoreServices services = FirestoreServices.instance;

  void addToBookMark({
    required News model,
  }) {
    emit(BookMarkAddedLoading());
    services
        .setData(path: 'users/$uID/bookMarks/${DateTime.now()}/', data: model.toJson())
        .then((value) {
      emit(BookMarkAddedSuccess());
    }).catchError((error) {
      emit(BookMarkAddedError(error.toString()));
    });
  }

  News? bookMarkModel;
  Stream<List<News>> getBookMark() {
    return services.collectionsStream(
        path: 'users/${CachHelper.getData(key: 'uId')}/bookMarks/',
        builder: (data, documentId) => bookMarkModel = News.fromJson(data!));
  }
}
