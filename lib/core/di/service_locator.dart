import 'package:get_it/get_it.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:film_magic/features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:film_magic/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
  
  // ViewModels
  sl.registerFactory(() => AuthViewModel(sl()));
}