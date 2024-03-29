import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/author_profile/data/repos/author_profile_repo.dart';
import 'package:news_app/features/author_profile/presentation/view_model/cubit/author_profile_state.dart';

class AuthorProfileCubit extends Cubit<AuthorProfileState> {
  AuthorProfileCubit(this.authorProfileRepo) : super(AuthorProfileInitial());
  static AuthorProfileCubit get(context) => BlocProvider.of(context);
  final AuthorProfileRepo authorProfileRepo;
  Future<void> fetchAuthorNews({required String sourceId}) async {
    emit(AuthorProfileGetNewsLoading());
    var result = await authorProfileRepo.fetchNewsToSource(sourceId: sourceId);
    result.fold((l) {
      emit(AuthorProfileGetNewsError(l.errorMessage));
    }, (r) {
      emit(AuthorProfileGetNewsSuccess(r));
    });
  }
}
