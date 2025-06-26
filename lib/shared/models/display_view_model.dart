import 'package:flutter/material.dart';

class DisplayViewModel {
  final String name;
  final IconData icon;
  final IconData selectedIcon;
  bool isSelected;

  DisplayViewModel({
    required this.name,
    required this.icon,
    required this.selectedIcon,
    this.isSelected = false,
  });
}
