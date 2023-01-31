import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';

import '../../../search/data/models/search_model.dart';

abstract class AuthorProfileRepo {
  Future<Either<Failure, List<News>>> fetchNewsToSource(
      {required String sourceId});
}
