import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

class FilmViewModel extends ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmViewModel(this._filmRepository);

  // State variables
  bool _isLoading = false;
  String? _errorMessage;
  
  // Film lists
  FilmListModel? _nowPlayingFilms;
  FilmListModel? _popularFilms;
  FilmListModel? _topRatedFilms;
  FilmListModel? _upcomingFilms;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FilmListModel? get nowPlayingFilms => _nowPlayingFilms;
  FilmListModel? get popularFilms => _popularFilms;
  FilmListModel? get topRatedFilms => _topRatedFilms;
  FilmListModel? get upcomingFilms => _upcomingFilms;

  // Load all film categories
  Future<void> loadAllFilms() async {
    _setLoading(true);
    _clearError();
    
    try {
      await Future.wait([
        _loadNowPlayingFilms(),
        _loadPopularFilms(),
        _loadTopRatedFilms(),
        _loadUpcomingFilms(),
      ]);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Load individual film categories
  Future<void> _loadNowPlayingFilms() async {
    try {
      _nowPlayingFilms = await _filmRepository.getNowPlayingFilms();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load now playing films: ${e.toString()}');
    }
  }

  Future<void> _loadPopularFilms() async {
    try {
      _popularFilms = await _filmRepository.getPopularFilms();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load popular films: ${e.toString()}');
    }
  }

  Future<void> _loadTopRatedFilms() async {
    try {
      _topRatedFilms = await _filmRepository.getTopRatedFilms();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load top rated films: ${e.toString()}');
    }
  }

  Future<void> _loadUpcomingFilms() async {
    try {
      _upcomingFilms = await _filmRepository.getUpcomingFilms();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load upcoming films: ${e.toString()}');
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