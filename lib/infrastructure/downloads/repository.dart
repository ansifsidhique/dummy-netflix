import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';
import 'package:netflix/domain/downloads/i_dowloads_repo.dat.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

@LazySingleton(as: IDownloadsRepo)
class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage() async {
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.downloads));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> results = json.decode(response.body)["results"];
        // print(results);
        final downloadsList =
        results.map((e) => Downloads.fromJson(e)).toList();
        // print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      // print(e);
      //  log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
