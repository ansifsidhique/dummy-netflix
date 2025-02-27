import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo{
 Future<Either<MainFailure,List<Downloads>>> getDownloadsImage();
}