import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/search/search_bloc.dart';

import '../../../application/downloads/downloads_bloc.dart';
import '../../../infrastructure/downloads/repository.dart';
import '../../../infrastructure/search/search_impl.dart';
import '../../downloads/i_dowloads_repo.dat.dart';
import '../../search/search_service.dart';


final getIt = GetIt.instance;
@InjectableInit()
Future<void> configureInjection() async {
   // $initGetIt(getIt, environment:Environment.prod);
  getIt.registerFactory(() => DownloadsBloc(getIt()));
  getIt.registerLazySingleton<IDownloadsRepo>(() => DownloadsRepository());


  getIt.registerFactory(() => SearchBloc(getIt(), getIt()));
  getIt.registerLazySingleton<SearchService>(() => SearchImpl());



}