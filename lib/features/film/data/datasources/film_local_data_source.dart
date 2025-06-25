import 'dart:convert';

import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';

class FilmLocalDataSource {
  final DatabaseHelper _databaseHelper;

  FilmLocalDataSource(this._databaseHelper);

  // Films list methods
  Future<void> cacheFilmList(String category, FilmListModel filmList) async {
    print(
      'Caching film list for category: $category with ${filmList.results.length} films',
    );

    // First, save the film list metadata
    await _databaseHelper.insert('film_lists', {
      'category': category,
      'page': filmList.page,
      'total_pages': filmList.totalPages,
      'total_results': filmList.totalResults,
      'dates_minimum': filmList.dates?.minimum,
      'dates_maximum': filmList.dates?.maximum,
      'cached_at': DateTime.now().toIso8601String(),
    });

    // Then save each film in the list
    for (final film in filmList.results) {
      await _cacheFilm(film, category);
    }
  }

  Future<void> _cacheFilm(FilmModel film, String category) async {
    // Save the film
    await _databaseHelper.insert('films', {
      'id': film.id,
      'title': film.title,
      'original_title': film.originalTitle,
      'overview': film.overview,
      'poster_path': film.posterPath,
      'backdrop_path': film.backdropPath,
      'release_date': film.releaseDate,
      'popularity': film.popularity,
      'vote_average': film.voteAverage,
      'vote_count': film.voteCount,
      'adult': film.adult ? 1 : 0,
      'video': film.video ? 1 : 0,
      'original_language': film.originalLanguage,
      'genre_ids': jsonEncode(film.genreIds),
    });

    // Save the film-category relationship
    await _databaseHelper.insert('film_categories', {
      'film_id': film.id,
      'category': category,
    });
  }

  Future<FilmListModel?> getFilmList(String category) async {
    // Get the film list metadata
    final listMaps = await _databaseHelper.query(
      'film_lists',
      where: 'category = ?',
      whereArgs: [category],
      limit: 1,
    );

    if (listMaps.isEmpty) return null;

    // Get all films for this category
    final filmIds = await _databaseHelper.query(
      'film_categories',
      columns: ['film_id'],
      where: 'category = ?',
      whereArgs: [category],
    );

    if (filmIds.isEmpty) return null;

    final List<FilmModel> films = [];

    for (final idMap in filmIds) {
      final filmId = idMap['film_id'] as int;
      final filmMaps = await _databaseHelper.query(
        'films',
        where: 'id = ?',
        whereArgs: [filmId],
      );

      if (filmMaps.isNotEmpty) {
        films.add(_mapToFilmModel(filmMaps.first));
      }
    }

    final listData = listMaps.first;
    return FilmListModel(
      page: listData['page'] as int,
      totalPages: listData['total_pages'] as int,
      totalResults: listData['total_results'] as int,
      results: films,
      dates: _createDateTimeRangeFromMap(listData),
    );
  }

  // Film details methods
  Future<void> cacheFilmDetails(FilmDetailModel filmDetail) async {
    // Implementation for caching film details
    // This would be more complex due to nested objects
  }

  Future<FilmDetailModel?> getFilmDetails(int filmId) async {
    // Implementation for retrieving film details
  }

  // Film credits methods
  Future<void> cacheFilmCredits(int filmId, FilmCreditsModel credits) async {
    // Implementation for caching film credits
  }

  Future<FilmCreditsModel?> getFilmCredits(int filmId) async {
    // Implementation for retrieving film credits
  }

  // Helper methods
  FilmModel _mapToFilmModel(Map<String, dynamic> map) {
    return FilmModel(
      id: map['id'] as int,
      title: map['title'] as String,
      originalTitle: map['original_title'] as String,
      overview: map['overview'] as String,
      posterPath: map['poster_path'] as String?,
      backdropPath: map['backdrop_path'] as String?,
      releaseDate: map['release_date'] as String,
      popularity: map['popularity'] as double,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
      adult: (map['adult'] as int) == 1,
      video: (map['video'] as int) == 1,
      originalLanguage: map['original_language'] as String,
      genreIds: List<int>.from(jsonDecode(map['genre_ids'] as String)),
    );
  }

  DateTimeRange? _createDateTimeRangeFromMap(Map<String, dynamic> map) {
    final minimum = map['dates_minimum'] as String?;
    final maximum = map['dates_maximum'] as String?;

    if (minimum == null || maximum == null) return null;

    return DateTimeRange(minimum: minimum, maximum: maximum);
  }

  // Check if cache is valid (not older than specified duration)
  Future<bool> isCacheValid(String category, Duration maxAge) async {
    final listMaps = await _databaseHelper.query(
      'film_lists',
      columns: ['cached_at'],
      where: 'category = ?',
      whereArgs: [category],
      limit: 1,
    );

    if (listMaps.isEmpty) return false;

    final cachedAtString = listMaps.first['cached_at'] as String;
    final cachedAt = DateTime.parse(cachedAtString);
    final now = DateTime.now();

    return now.difference(cachedAt) <= maxAge;
  }
}
