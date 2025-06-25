import 'package:film_magic/features/authentication/data/models/user_model.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

enum AuthStatus { initial, authenticated, unauthenticated, loading, error }

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthStatus _status = AuthStatus.initial;
  UserModel? _user;
  String? _errorMessage;
  ThemePreference _themePreference = ThemePreference.systemDefault;

  AuthViewModel(this._authRepository) {
    // Listen to auth state changes
    _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        _user = user;
        _status = AuthStatus.authenticated;
        _themePreference = user.themePreference;
      } else {
        _user = null;
        _status = AuthStatus.unauthenticated;
      }
      notifyListeners();
    });

    // Check if user is already signed in
    _checkCurrentUser();
    // Load theme preference
    _loadThemePreference();
  }

  // Getters
  AuthStatus get status => _status;
  UserModel? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isLoading => _status == AuthStatus.loading;
  ThemePreference get themePreference => _themePreference;
  ThemeMode get themeMode {
    switch (_themePreference) {
      case ThemePreference.light:
        return ThemeMode.light;
      case ThemePreference.dark:
        return ThemeMode.dark;
      case ThemePreference.systemDefault:
        return ThemeMode.system;
    }
  }

  Future<void> _checkCurrentUser() async {
    try {
      _status = AuthStatus.loading;
      notifyListeners();

      final user = await _authRepository.getCurrentUser();

      if (user != null) {
        _user = user;
        _themePreference = user.themePreference;
        _status = AuthStatus.authenticated;
      } else {
        _status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> _loadThemePreference() async {
    try {
      _themePreference = await _authRepository.getCurrentThemePreference();
      notifyListeners();
    } catch (e) {
      // If there's an error, we'll keep the default theme
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      _status = AuthStatus.loading;
      _errorMessage = null;
      notifyListeners();

      _user = await _authRepository.signInWithGoogle();
      _themePreference = _user!.themePreference;
      _status = AuthStatus.authenticated;
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      _status = AuthStatus.loading;
      notifyListeners();
      
      await _authRepository.signOut();
      _status = AuthStatus.unauthenticated;
      _user = null;
    } catch (e) {
      _status = AuthStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateThemePreference(ThemePreference preference) async {
    try {
      await _authRepository.updateThemePreference(preference);
      _themePreference = preference;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
