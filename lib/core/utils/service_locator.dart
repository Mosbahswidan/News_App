import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/author_profile/data/repos/author_profile_impl.dart';
import 'package:news_app/features/author_profile/data/repos/author_profile_repo.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<AuthorProfileImpl>(
      AuthorProfileImpl(getIt.get<ApiServices>()));
}
