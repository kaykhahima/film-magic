import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/models/genre_list_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

import '../../../../shared/models/display_view_model.dart';

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

  // Genres
  GenreListModel? _genres;
  String? _genresErrorMessage;

  // Filter state
  String _searchQuery = '';
  String _selectedCategory = 'Top Rated'; // Default category
  List<int> _selectedGenreIds = [];

  // Filter options
  final List<String> categoryOptions = [
    'Top Rated',
    'Popular',
    'Currently Playing',
    'New & Upcoming',
  ];

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  FilmListModel? get nowPlayingFilms => _nowPlayingFilms;
  FilmListModel? get popularFilms => _popularFilms;
  FilmListModel? get topRatedFilms => _topRatedFilms;
  FilmListModel? get upcomingFilms => _upcomingFilms;

  // Genre getters
  GenreListModel? get genres => _genres;
  String? get genresErrorMessage => _genresErrorMessage;

  // Filter getters
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  List<int> get selectedGenreIds => _selectedGenreIds;
  bool get hasFilters =>
      _searchQuery.isNotEmpty ||
      _selectedCategory != 'Top Rated' ||
      _selectedGenreIds.isNotEmpty;

  DisplayViewModel get selectedView =>
      displayViews.firstWhere((v) => v.isSelected);

  List<DisplayViewModel> displayViews = [
    DisplayViewModel(
      name: 'List',
      icon: Icons.view_agenda_outlined,
      selectedIcon: Icons.view_agenda,
      isSelected: true,
    ),
    DisplayViewModel(
      name: 'Grid',
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
    ),
  ];

  // Get filtered films based on current filters
  List<FilmModel> get filteredFilms {
    // Start with the appropriate category of films
    FilmListModel? baseFilms;
    switch (_selectedCategory) {
      case 'Top Rated':
        baseFilms = _topRatedFilms;
        break;
      case 'Popular':
        baseFilms = _popularFilms;
        break;
      case 'Currently Playing':
        baseFilms = _nowPlayingFilms;
        break;
      case 'New & Upcoming':
        baseFilms = _upcomingFilms;
        break;
      default:
        baseFilms = _topRatedFilms;
    }

    if (baseFilms == null) return [];

    // Apply search and genre filters
    return baseFilms.results.where((film) {
      // Filter by search query
      final matchesSearch =
          _searchQuery.isEmpty ||
          film.title.toLowerCase().contains(_searchQuery.toLowerCase());

      // Filter by selected genres
      final matchesGenres =
          _selectedGenreIds.isEmpty ||
          _selectedGenreIds.every((genreId) => film.genreIds.contains(genreId));

      return matchesSearch && matchesGenres;
    }).toList();
  }

  // Filter setters
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void toggleGenreSelection(int genreId) {
    if (_selectedGenreIds.contains(genreId)) {
      _selectedGenreIds.remove(genreId);
    } else {
      _selectedGenreIds.add(genreId);
    }
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedCategory = 'Top Rated';
    _selectedGenreIds = [];
    notifyListeners();
  }

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
        _loadGenres(),
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

  // Genre methods
  Future<void> _loadGenres() async {
    try {
      _genres = await _filmRepository.getGenres();
      notifyListeners();
    } catch (e) {
      _setError('Failed to load genres: ${e.toString()}');
    }
  }

  Future<Genre?> getGenreById(int genreId) async {
    try {
      // If genres are already loaded, try to find the genre in the cached list
      if (_genres != null) {
        final cachedGenre = _genres!.genres.firstWhere(
          (genre) => genre.id == genreId,
          orElse: () => throw Exception('Genre not found in cache'),
        );
        return cachedGenre;
      }

      // If genres aren't loaded yet, fetch directly from repository
      return await _filmRepository.getGenreById(genreId);
    } catch (e) {
      _setError('Failed to get genre: ${e.toString()}');
      return null;
    }
  }

  /// Returns a list of Genre objects corresponding to the provided genre IDs.
  /// If a genre ID doesn't match any available genre, it will be skipped.
  List<Genre> getGenresByIds(List<int> genreIds) {
    if (genreIds.isEmpty) return [];

    try {
      // If still null after loading attempt, return empty list
      if (_genres == null) return [];

      // Filter genres that match the provided IDs
      final matchedGenres = _genres!.genres
          .where((genre) => genreIds.contains(genre.id))
          .toList();

      return matchedGenres;
    } catch (e) {
      _setError('Failed to get genres by IDs: ${e.toString()}');
      return [];
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

  void setSelectedView(DisplayViewModel view) {
    for (var v in displayViews) {
      v.isSelected = false;
    }
    view.isSelected = true;
    notifyListeners();
  }
}
