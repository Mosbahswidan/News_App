import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/author_profile/data/repos/author_profile_impl.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<AuthorProfileImpl>(
      AuthorProfileImpl(getIt.get<ApiServices>()));
}
