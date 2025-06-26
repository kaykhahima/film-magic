import 'package:film_magic/core/utils/nav_keys.dart';
import 'package:film_magic/features/actor/presentation/views/actor_screen.dart';
import 'package:film_magic/features/film/presentation/views/film_details_screen.dart';
import 'package:film_magic/features/film/presentation/views/film_screen.dart';
import 'package:film_magic/features/home/presentation/views/home_screen.dart';
import 'package:film_magic/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/authentication/presentation/viewmodels/auth_viewmodel.dart';
import '../../features/authentication/presentation/views/registration_screen.dart';
import '../../features/film/data/models/film_credits_model.dart';
import '../../features/film/data/models/film_list_model.dart';
import '../../shared/widgets/main_wrapper.dart';

class AppRouter {
  // Route names (constants) for easy referencing and to avoid typos.
  static const String registrationRoute = '/register';
  static const String homeRoute = '/';
  static const String filmsRoute = '/films';
  static const String filmDetailsRoute = '/film-details';
  static const String actorDetailsRoute = '/actor-details';
  static const String profileRoute = '/profile';

  static final router = GoRouter(
    navigatorKey: NavKeys.rootNavKey,
    initialLocation: registrationRoute,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) {
          return MainWrapper(navShell: navShell, state: state);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: NavKeys.homeNavKey,
            routes: [
              GoRoute(
                path: homeRoute,
                name: homeRoute,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: NavKeys.filmNavKey,
            routes: [
              GoRoute(
                path: filmsRoute,
                name: filmsRoute,
                builder: (context, state) {
                  return const FilmScreen();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: NavKeys.profileNavKey,
            routes: [
              GoRoute(
                path: profileRoute,
                name: profileRoute,
                builder: (context, state) {
                  return const ProfileScreen();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: NavKeys.rootNavKey,
        path: registrationRoute,
        name: registrationRoute,
        builder: (context, state) => RegistrationScreen(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: NavKeys.rootNavKey,
        path: actorDetailsRoute,
        name: actorDetailsRoute,
        pageBuilder: (context, state) {
          final actor = state.extra as FilmCastModel?;

          return CustomTransitionPage(
            key: state.pageKey,
            child: ActorDetailsScreen(key: state.pageKey, actor: actor!),
            transitionsBuilder: _fadeCurveTransition,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: NavKeys.rootNavKey,
        path: filmDetailsRoute,
        name: filmDetailsRoute,
        pageBuilder: (context, state) {
          final film = state.extra as FilmModel?;

          return CustomTransitionPage(
            key: state.pageKey,
            child: FilmDetailsScreen(key: state.pageKey, film: film!),
            transitionsBuilder: _fadeCurveTransition,
          );
        },
      ),
    ],
    redirect: (context, state) {
      final authViewModel = context.read<AuthViewModel>();
      final bool isAuthenticated = authViewModel.isAuthenticated;
      final bool isLoading = authViewModel.isLoading;
      final bool isLoginRoute = state.matchedLocation == registrationRoute;

      // if (kDebugMode) {
      //   print(
      //     'Redirect check - Auth: $isAuthenticated, Loading: $isLoading, LoginRoute: $isLoginRoute',
      //   );
      // }

      // If still loading, don't redirect yet
      if (isLoading) return null;

      // If not authenticated and not on login route, redirect to login
      if (!isAuthenticated && !isLoginRoute) {
        return registrationRoute;
      }

      // If authenticated and on login route, redirect to home
      if (isAuthenticated && isLoginRoute) {
        return homeRoute;
      }

      // No redirection needed
      return null;
    },
    errorBuilder: (BuildContext context, GoRouterState state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(child: Text('No route defined for ${state.uri.path}')),
      );
    },
  );
}

Widget _fadeCurveTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Interval(0, 0.5, curve: Curves.easeInOutExpo),
  );
  return FadeTransition(opacity: curvedAnimation, child: child);
}
