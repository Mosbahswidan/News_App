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

  @override
  Future<Either<Failure, List<NewsModel>>> fetchAll() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=cd02c34afa26497ca935ba0c2cdc72b3&q=all");

      List<NewsModel> allNews = [];
      for (var item in data['articles']) {
        try {
          allNews.add(NewsModel.fromJson(item));
        } catch (e) {
          allNews.add(NewsModel.fromJson(item));
        }
      }
      return right(allNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchSports() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=cd02c34afa26497ca935ba0c2cdc72b3&country=us&category=sports");

      List<NewsModel> sportsNews = [];
      for (var item in data['articles']) {
        try {
          sportsNews.add(NewsModel.fromJson(item));
        } catch (e) {
          sportsNews.add(NewsModel.fromJson(item));
        }
      }
      return right(sportsNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchPolitics() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=cd02c34afa26497ca935ba0c2cdc72b3&country=us&category=general");

      List<NewsModel> politicsNews = [];
      for (var item in data['articles']) {
        try {
          politicsNews.add(NewsModel.fromJson(item));
        } catch (e) {
          politicsNews.add(NewsModel.fromJson(item));
        }
      }
      return right(politicsNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchBussiness() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=cd02c34afa26497ca935ba0c2cdc72b3&country=us&category=business");

      List<NewsModel> businessNews = [];
      for (var item in data['articles']) {
        try {
          businessNews.add(NewsModel.fromJson(item));
        } catch (e) {
          businessNews.add(NewsModel.fromJson(item));
        }
      }
      return right(businessNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> fetchHealth() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=cd02c34afa26497ca935ba0c2cdc72b3&country=us&category=health");

      List<NewsModel> healthNews = [];
      for (var item in data['articles']) {
        try {
          healthNews.add(NewsModel.fromJson(item));
        } catch (e) {
          healthNews.add(NewsModel.fromJson(item));
        }
      }
      return right(healthNews);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
