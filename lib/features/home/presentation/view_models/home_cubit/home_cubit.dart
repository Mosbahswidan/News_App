import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

import '../../../data/repos/homr_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> fetchTendingsNews() async {
    emit(HomeGetTrendingLoading());
    var result = await homeRepo.fetchTrending();
    result.fold((l) {
      emit(HomeGetTrendingError(l.errorMessage));
    }, (r) {
      emit(HomeGetTrendingSuccsess(r));
    });
  }
}
