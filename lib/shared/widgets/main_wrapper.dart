import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'bottom_nav_bar.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key, required this.state, required this.navShell});

  final GoRouterState state;
  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navShell,
      bottomNavigationBar: BottomNavBar(navShell: navShell),
    );
  }
}
