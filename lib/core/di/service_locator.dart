import 'package:get_it/get_it.dart';
import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:film_magic/features/authentication/presentation/viewmodels/auth_viewmodel.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo());
  sl.registerLazySingleton(() => DatabaseHelper());
  
  // Data sources
  sl.registerLazySingleton(() => AuthLocalDataSource(sl()));
  
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  
  // ViewModels
  sl.registerFactory(() => AuthViewModel(sl()));
}