import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/data/repos/homr_repo.dart';

import '../../../../core/utils/api_services.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<NewsModel>>> fetchTrending() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/everything?q=trending&apiKey=cd02c34afa26497ca935ba0c2cdc72b3");

      List<NewsModel> news = [];
      for (var item in data['articles']) {
        try {
          news.add(NewsModel.fromJson(item));
        } catch (e) {
          news.add(NewsModel.fromJson(item));
        }
      }
      return right(news);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
