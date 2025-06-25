import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/features/authentication/data/models/user_model.dart';

class AuthLocalDataSource {
  final DatabaseHelper _databaseHelper;
  
  AuthLocalDataSource(this._databaseHelper);
  
  Future<void> saveUser(UserModel user) async {
    await _databaseHelper.insert(
      'users',
      {
        'id': user.id,
        'email': user.email,
        'name': user.name,
        'image_url': user.imageUrl,
        'theme_preference': user.themePreference.name,
      },
    );
  }

  Future<UserModel?> getUser(String id) async {
    final maps = await _databaseHelper.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return null;

    final userData = maps.first;
    return UserModel(
      id: userData['id'] as String,
      email: userData['email'] as String,
      name: userData['name'] as String,
      imageUrl: userData['image_url'] as String?,
      themePreference: _parseThemePreference(userData['theme_preference'] as String),
    );
  }

  Future<UserModel?> getLastLoggedInUser() async {
    final maps = await _databaseHelper.query('users', limit: 1);

    if (maps.isEmpty) return null;

    final userData = maps.first;
    return UserModel(
      id: userData['id'] as String,
      email: userData['email'] as String,
      name: userData['name'] as String,
      imageUrl: userData['image_url'] as String?,
      themePreference: _parseThemePreference(userData['theme_preference'] as String),
    );
  }

  Future<void> updateUserThemePreference(String userId, ThemePreference preference) async {
    await _databaseHelper.update(
      'users',
      {'theme_preference': preference.name},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<void> deleteUser(String id) async {
    await _databaseHelper.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Helper method to parse ThemePreference from string
  ThemePreference _parseThemePreference(String value) {
    return ThemePreference.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemePreference.systemDefault,
    );
  }
}