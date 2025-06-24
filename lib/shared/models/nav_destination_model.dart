import 'package:flutter/material.dart';

import '../../core/navigation/app_router.dart';

class NavDestination {
  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final String path;

  NavDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.path,
  });
}

List<NavDestination> destinations = <NavDestination>[
  NavDestination(
    label: 'Home',
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    path: AppRouter.homeRoute,
  ),
  NavDestination(
    label: 'Films',
    icon: Icon(Icons.movie_outlined),
    selectedIcon: Icon(Icons.movie),
    path: AppRouter.filmsRoute,
  ),
  NavDestination(
    label: 'Profile',
    icon: const Icon(Icons.person_outline),
    selectedIcon: const Icon(Icons.person),
    path: AppRouter.profileRoute,
  ),
];
