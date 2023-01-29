import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/book_mark/presentation/view_model/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());
}
