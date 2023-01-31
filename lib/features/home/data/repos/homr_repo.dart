import 'package:dartz/dartz.dart';
import 'package:news_app/features/home/data/models/news_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> fetchTrending();
}
