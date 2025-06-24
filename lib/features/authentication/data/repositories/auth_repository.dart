import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:film_magic/features/authentication/data/models/user_model.dart';

abstract class AuthRepository {
  /// Sign in with Google
  Future<UserModel> signInWithGoogle();
  
  /// Sign out the current user
  Future<void> signOut();
  
  /// Get the current authenticated user
  Future<UserModel?> getCurrentUser();
  
  /// Stream of authentication state changes
  Stream<UserModel?> get authStateChanges;
}