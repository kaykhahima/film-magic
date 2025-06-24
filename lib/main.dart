import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/di/service_locator.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/nav_keys.dart';
import 'features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize service locator
  await initServiceLocator();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => sl<AuthViewModel>())],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, bool>(
      builder: (BuildContext context, isAuthenticated, Widget? child) {
        // Whenever isLoggedIn changes, refresh the router
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AppRouter.router.refresh();
        });

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
        );
      },
      selector: (_, authService) => authService.isAuthenticated,
    );
  }
}
