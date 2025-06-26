import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'user_model.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String id;
  final String email;
  final String name;
  final String? imageUrl;
  final ThemePreference themePreference;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.imageUrl,
    this.themePreference = ThemePreference.systemDefault,
  });
}

@MappableEnum()
enum ThemePreference {
  systemDefault(
    'System Default',
    'Follow system settings',
    Icons.brightness_auto,
  ),
  light('Light', 'Light', Icons.light_mode),
  dark('Dark', 'Dark', Icons.dark_mode);

  final String name;
  final String description;
  final IconData icon;
  const ThemePreference(this.name, this.description, this.icon);
}
