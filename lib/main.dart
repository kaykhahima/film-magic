import 'package:film_magic/features/actor/presentation/viewmodels/actor_viewmodel.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_detail_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'core/di/service_locator.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'features/film/presentation/viewmodels/film_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize service locator
  await initServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<AuthViewModel>()),
        ChangeNotifierProvider(create: (_) => sl<FilmViewModel>()),
        ChangeNotifierProvider(create: (_) => sl<FilmDetailViewModel>()),
        ChangeNotifierProvider(create: (_) => sl<ActorViewModel>()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (BuildContext context, authViewModel, Widget? child) {
        // Whenever auth state or theme changes, refresh the router
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppRouter.router.refresh();
        });

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: authViewModel.themeMode,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
        );
      },
    );
  }
}
