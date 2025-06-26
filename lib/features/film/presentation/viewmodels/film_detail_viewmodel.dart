import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

import '../../data/models/film_list_model.dart';

class FilmDetailViewModel extends ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmDetailViewModel(this._filmRepository);

  // State variables
  bool _isLoading = false;
  String? _errorMessage;

  // Film details
  FilmDetailModel? _filmDetails;
  FilmCreditsModel? _filmCredits;
  FilmListModel? _similarFilms;
  FilmListModel? _recommendedFilms;
  // Add new state variables

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FilmDetailModel? get filmDetails => _filmDetails;
  FilmCreditsModel? get filmCredits => _filmCredits;
  FilmListModel? get similarFilms => _similarFilms;
  FilmListModel? get recommendedFilms => _recommendedFilms;

  FilmDetailModel get dummyFilmDetails => FilmDetailModel(
    adult: false,
    backdropPath: '/path/to/backdrop.jpg',
    belongsToCollection: FilmCollection(
      id: 123,
      name: 'Collection Name',
      posterPath: '/path/to/poster.jpg',
      backdropPath: '/path/to/backdrop.jpg',
    ),
    budget: 200000000,
    genres: [FilmGenre(id: 28, name: 'Action')],
    homepage: 'https://example.com',
    id: 123,
    imdbId: 'tt1234567',
    originCountry: ['US'],
    originalLanguage: 'en',
    originalTitle: 'Original Title',
    overview: 'Movie overview text',
    popularity: 8.5,
    posterPath: '/path/to/poster.jpg',
    productionCompanies: [
      ProductionCompany(
        id: 456,
        logoPath: '/path/to/logo.png',
        name: 'Production Company',
        originCountry: 'US',
      ),
    ],
    productionCountries: [
      ProductionCountry(iso31661: 'US', name: 'United States'),
    ],
    releaseDate: '2023-05-15',
    revenue: 500000000,
    runtime: 120,
    spokenLanguages: [
      SpokenLanguage(englishName: 'English', iso6391: 'en', name: 'English'),
    ],
    status: 'Released',
    tagline: 'Movie tagline',
    title: 'Movie Title',
    video: false,
    voteAverage: 7.8,
    voteCount: 1500,
  );

  // Load film details
  Future<void> loadFilmDetails(int filmId) async {
    _setLoading(true);
    _clearError();

    try {
      _filmDetails = await _filmRepository.getFilmDetails(filmId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to load film details: ${e.toString()}');
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
    // notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    // notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    // notifyListeners();
  }

  // Load similar films
  Future<void> loadSimilarFilms(int filmId) async {
    try {
      final films = await _filmRepository.getSimilarFilms(filmId);
      _similarFilms = films;
    } catch (e) {
      _setError('Failed to load similar films: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }
}
