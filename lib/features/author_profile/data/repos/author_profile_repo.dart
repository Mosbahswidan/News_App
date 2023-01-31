import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

abstract class AuthorProfileRepo {
  Future<Either<Failure, List<NewsModel>>> fetchNewsToSource(
      {required String sourceId});
}