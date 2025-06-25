import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

class FilmDetailViewModel extends ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmDetailViewModel(this._filmRepository);

  // State variables
  bool _isLoading = false;
  String? _errorMessage;
  
  // Film details
  FilmDetailModel? _filmDetails;
  FilmCreditsModel? _filmCredits;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FilmDetailModel? get filmDetails => _filmDetails;
  FilmCreditsModel? get filmCredits => _filmCredits;

  // Load film details
  Future<void> loadFilmDetails(int filmId) async {
    _setLoading(true);
    _clearError();
    
    try {
      _filmDetails = await _filmRepository.getFilmDetails(filmId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load film details: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  // Load film credits
  Future<void> loadFilmCredits(int filmId) async {
    try {
      _filmCredits = await _filmRepository.getFilmCredits(filmId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load film credits: ${e.toString()}');
    }
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}