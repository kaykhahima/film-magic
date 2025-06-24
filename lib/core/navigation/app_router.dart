import 'package:film_magic/core/utils/nav_keys.dart';
import 'package:film_magic/features/actor/presentation/views/actor_screen.dart';
import 'package:film_magic/features/film/presentation/views/film_details_screen.dart';
import 'package:film_magic/features/film/presentation/views/film_screen.dart';
import 'package:film_magic/features/home/presentation/views/home_screen.dart';
import 'package:film_magic/features/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/views/registration_screen.dart';
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
    debugLogDiagnostics: false,
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
        builder: (context, state) {
          final actorId = state.extra as String?;
          return ActorDetailsScreen(key: state.pageKey, actorId: actorId!);
        },
      ),
      GoRoute(
        parentNavigatorKey: NavKeys.rootNavKey,
        path: filmDetailsRoute,
        name: filmDetailsRoute,
        builder: (context, state) {
          final filmId = state.extra as String?;
          return FilmDetailsScreen(key: state.pageKey, filmId: filmId!);
        },
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(child: Text('No route defined for ${state.uri.path}')),
      );
    },
  );
}
