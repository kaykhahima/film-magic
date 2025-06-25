import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/nav_destination_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: navShell.currentIndex,
        onTap: _onDestinationSelected,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: destinations
            .map(
              (dest) => BottomNavigationBarItem(
                icon: dest.icon,
                activeIcon: dest.selectedIcon,
                label: dest.label,
              ),
            )
            .toList(),
      ),
    );
  }

  void _onDestinationSelected(int index) {
    navShell.goBranch(index, initialLocation: index == navShell.currentIndex);
  }
}
