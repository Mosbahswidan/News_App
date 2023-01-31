import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_state.dart';
import '../../../data/repos/homr_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
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

  Future<void> fetchAllNews() async {
    emit(HomeGetAllLoading());
    var result = await homeRepo.fetchAll();
    result.fold((l) {
      emit(HomeGetAllError(l.errorMessage));
    }, (r) {
      emit(HomeGetAllSuccsess(r));
    });
  }

  Future<void> fetchSportsNews() async {
    emit(HomeGetSportsLoading());
    var result = await homeRepo.fetchSports();
    result.fold((l) {
      emit(HomeGetSportsError(l.errorMessage));
    }, (r) {
      emit(HomeGetSportsSuccsess(r));
    });
  }

  Future<void> fetchPoliticsNews() async {
    emit(HomeGetPoliticLoading());
    var result = await homeRepo.fetchPolitics();
    result.fold((l) {
      emit(HomeGetPoliticError(l.errorMessage));
    }, (r) {
      emit(HomeGetPoliticSuccess(r));
    });
  }

  Future<void> fetchBusinessNews() async {
    emit(HomeGetBusinessLoading());
    var result = await homeRepo.fetchBussiness();
    result.fold((l) {
      emit(HomeGetBusinessError(l.errorMessage));
    }, (r) {
      emit(HomeGetBusinessSuccess(r));
    });
  }

  Future<void> fetchHealthNews() async {
    emit(HomeGetHealthLoading());
    var result = await homeRepo.fetchHealth();
    result.fold((l) {
      emit(HomeGetHealthEror(l.errorMessage));
    }, (r) {
      emit(HomeGetHealthSuccess(r));
    });
  }
}
