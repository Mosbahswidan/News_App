import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> fetchTrending();
  Future<Either<Failure, List<NewsModel>>> fetchAll();
  Future<Either<Failure, List<NewsModel>>> fetchSports();
  Future<Either<Failure, List<NewsModel>>> fetchPolitics();
  Future<Either<Failure, List<NewsModel>>> fetchHealth();
  Future<Either<Failure, List<NewsModel>>> fetchBussiness();
}
