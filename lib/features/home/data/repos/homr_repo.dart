import 'package:dartz/dartz.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<News>>> fetchTrending();
  Future<Either<Failure, List<News>>> fetchAll();
  Future<Either<Failure, List<News>>> fetchSports();
  Future<Either<Failure, List<News>>> fetchPolitics();
  Future<Either<Failure, List<News>>> fetchHealth();
  Future<Either<Failure, List<News>>> fetchBussiness();
}
