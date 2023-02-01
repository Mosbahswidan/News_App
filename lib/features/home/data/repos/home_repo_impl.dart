import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/data/repos/homr_repo.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

import '../../../../core/utils/api_services.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<News>>> fetchTrending() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/everything?q=trending&apiKey=693382b600a64013b48387fcc9a93211");

      List<News> news = [];
      for (var item in data['articles']) {
        try {
          news.add(News.fromJson(item));
        } catch (e) {
          news.add(News.fromJson(item));
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
  Future<Either<Failure, List<News>>> fetchAll() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=693382b600a64013b48387fcc9a93211&q=all");

      List<News> allNews = [];
      for (var item in data['articles']) {
        try {
          allNews.add(News.fromJson(item));
        } catch (e) {
          allNews.add(News.fromJson(item));
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
  Future<Either<Failure, List<News>>> fetchSports() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=693382b600a64013b48387fcc9a93211&country=us&category=sports");

      List<News> sportsNews = [];
      for (var item in data['articles']) {
        try {
          sportsNews.add(News.fromJson(item));
        } catch (e) {
          sportsNews.add(News.fromJson(item));
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
  Future<Either<Failure, List<News>>> fetchPolitics() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=693382b600a64013b48387fcc9a93211&country=us&category=general");

      List<News> politicsNews = [];
      for (var item in data['articles']) {
        try {
          politicsNews.add(News.fromJson(item));
        } catch (e) {
          politicsNews.add(News.fromJson(item));
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
  Future<Either<Failure, List<News>>> fetchBussiness() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=693382b600a64013b48387fcc9a93211&country=us&category=business");

      List<News> businessNews = [];
      for (var item in data['articles']) {
        try {
          businessNews.add(News.fromJson(item));
        } catch (e) {
          businessNews.add(News.fromJson(item));
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
  Future<Either<Failure, List<News>>> fetchHealth() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "/top-headlines?apiKey=693382b600a64013b48387fcc9a93211&country=us&category=health");

      List<News> healthNews = [];
      for (var item in data['articles']) {
        try {
          healthNews.add(News.fromJson(item));
        } catch (e) {
          healthNews.add(News.fromJson(item));
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
