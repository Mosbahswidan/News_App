import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_details_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit() : super(NewsDetailsInitial());
}
