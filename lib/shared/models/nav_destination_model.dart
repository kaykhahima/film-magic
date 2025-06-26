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
    selectedIcon: Icon(Icons.home_rounded),
    path: AppRouter.homeRoute,
  ),
  NavDestination(
    label: 'Explore',
    icon: Icon(Icons.dashboard_outlined),
    selectedIcon: Icon(Icons.dashboard_rounded),
    path: AppRouter.filmsRoute,
  ),
  NavDestination(
    label: 'Profile',
    icon: const Icon(Icons.person_outline),
    selectedIcon: const Icon(Icons.person_rounded),
    path: AppRouter.profileRoute,
  ),
];
