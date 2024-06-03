import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';

import 'models/search_response.dart';

abstract class SearchService{
  Future <Either<MainFailure,SearchResponse>> searchMovies({
    required String movieQuery
});
}