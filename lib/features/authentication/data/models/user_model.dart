import 'package:dart_mappable/dart_mappable.dart';

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
  systemDefault('System Default'),
  light('Light'),
  dark('Dark');

  final String name;
  const ThemePreference(this.name);
}
