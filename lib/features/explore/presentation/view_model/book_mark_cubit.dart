import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/explore/presentation/view_model/book_mark_state.dart';

class BookMarkCubit extends Cubit<BookMarkState> {
  BookMarkCubit() : super(BookMarkInitial());
}
