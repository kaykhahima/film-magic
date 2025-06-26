import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:film_magic/features/authentication/data/models/user_model.dart';
import 'package:film_magic/features/authentication/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final _authStateController = StreamController<UserModel?>.broadcast();

  AuthRepositoryImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required AuthLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
       _googleSignIn =
           googleSignIn ?? GoogleSignIn(scopes: ['email', 'profile']),
       _localDataSource = localDataSource,
       _networkInfo = networkInfo {
    // Listen to Firebase auth state changes and update our stream
    _firebaseAuth.authStateChanges().listen((firebaseUser) async {
      if (firebaseUser != null) {
        final userModel = _mapFirebaseUserToUserModel(firebaseUser);
        // Save user to local database whenever we get an update from Firebase
        await _localDataSource.saveUser(userModel);
        _authStateController.add(userModel);
      } else {
        _authStateController.add(null);
      }
    });
  }

  @override
  Stream<UserModel?> get authStateChanges => _authStateController.stream;

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // Check if we have internet connection
      final hasConnection = await _networkInfo.isConnected;

      if (hasConnection) {
        // If online, try to get user from Firebase
        final firebaseUser = _firebaseAuth.currentUser;
        if (firebaseUser != null) {
          final userModel = _mapFirebaseUserToUserModel(firebaseUser);
          // Save to local database for offline access
          await _localDataSource.saveUser(userModel);
          return userModel;
        }
      }

      // If offline or no Firebase user, try to get from local database
      return await _localDataSource.getLastLoggedInUser();
    } catch (e) {
      // If all fails, try local database as last resort
      return await _localDataSource.getLastLoggedInUser();
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      // Check if we have internet connection
      final hasConnection = await _networkInfo.isConnected;
      if (!hasConnection) {
        // If offline, try to get from local database
        final localUser = await _localDataSource.getLastLoggedInUser();
        if (localUser != null) {
          return localUser;
        }
        throw Exception('No internet connection and no local user found');
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google sign in was cancelled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        throw Exception('Failed to sign in with Google');
      }

      final userModel = _mapFirebaseUserToUserModel(firebaseUser);
      // Save to local database
      await _localDataSource.saveUser(userModel);
      return userModel;
    } catch (e) {
      throw Exception('Failed to sign in with Google: ${e.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // We don't delete the local user data to allow for offline login later
      // Just sign out from Firebase and Google
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }

  @override
  Future<void> updateThemePreference(ThemePreference preference) async {
    try {
      final currentUser = await getCurrentUser();
      if (currentUser != null) {
        await _localDataSource.updateUserThemePreference(
          currentUser.id,
          preference,
        );

        // Update our auth state stream with the new user data
        final updatedUser = currentUser.copyWith(themePreference: preference);
        _authStateController.add(updatedUser);
      }
    } catch (e) {
      throw Exception('Failed to update theme preference: ${e.toString()}');
    }
  }

  @override
  Future<ThemePreference> getCurrentThemePreference() async {
    try {
      final currentUser = await getCurrentUser();
      return currentUser?.themePreference ?? ThemePreference.systemDefault;
    } catch (e) {
      return ThemePreference.systemDefault;
    }
  }

  // Helper method to map Firebase User to our UserModel
  UserModel _mapFirebaseUserToUserModel(firebase_auth.User firebaseUser) {
    return UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      imageUrl: firebaseUser.photoURL,
      themePreference: ThemePreference
          .systemDefault, // Default value, will be overridden if stored
    );
  }
}
