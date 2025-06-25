import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/core/network/api_client.dart';
import 'package:film_magic/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:film_magic/features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';
import 'package:film_magic/features/film/data/repositories/film_repository_impl.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_viewmodel.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_detail_viewmodel.dart';

import '../../features/film/data/datasources/film_local_data_source.dart';
import '../../features/film/data/datasources/film_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo());
  sl.registerLazySingleton(() => DatabaseHelper());

  // External
  sl.registerLazySingleton(() => http.Client());

  // API
  final tmdbApiReadAccessToken = dotenv.env['TMDB_API_READ_ACCESS_TOKEN'] ?? '';
  sl.registerLazySingleton(() => ApiClient(sl(), tmdbApiReadAccessToken));

  // Data sources
  sl.registerLazySingleton(() => AuthLocalDataSource(sl()));
  sl.registerLazySingleton(() => FilmLocalDataSource(sl()));
  sl.registerLazySingleton(() => FilmRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDataSource: sl(), networkInfo: sl()),
  );

  // Add Film Repository
  sl.registerLazySingleton<FilmRepository>(
    () => FilmRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  // ViewModels
  sl.registerFactory(() => AuthViewModel(sl()));
  sl.registerFactory(() => FilmViewModel(sl()));
  sl.registerFactory(() => FilmDetailViewModel(sl()));
}
