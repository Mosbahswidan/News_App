import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news_details/presentation/view_model/news_details_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit() : super(NewsDetailsInitial());
}
