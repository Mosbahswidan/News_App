import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/utils/api_services.dart';
import 'package:news_app/features/author_profile/data/repos/author_profile_repo.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

class AuthorProfileImpl implements AuthorProfileRepo {
  final ApiServices apiServices;

  AuthorProfileImpl(this.apiServices);
  @override
  Future<Either<Failure, List<NewsModel>>> fetchNewsToSource(
      {required String sourceId}) async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?sources=$sourceId&apiKey=cd02c34afa26497ca935ba0c2cdc72b3");

      List<NewsModel> authorNews = [];
      for (var item in data['articles']) {
        try {
          authorNews.add(NewsModel.fromJson(item));
        } catch (e) {
          authorNews.add(NewsModel.fromJson(item));
        }
      }
      return right(authorNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
