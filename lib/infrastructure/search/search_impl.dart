import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';
import 'package:netflix/domain/search/models/search_response.dart';
import 'package:netflix/domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure,SearchResponse >> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {'query': movieQuery},
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        final data = SearchResponse.fromJson(response.data);
        // print(data);
        // log(data.toString());
        return Right(data);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      // log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
    // log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
