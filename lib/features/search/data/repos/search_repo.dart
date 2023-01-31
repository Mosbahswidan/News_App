import 'package:dartz/dartz.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import '../../../../core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> fetchSearch();
}
