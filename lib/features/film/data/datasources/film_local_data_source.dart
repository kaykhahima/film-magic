import 'dart:convert';

import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/genre_list_model.dart';

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
    print('Caching film details for film ID: ${filmDetail.id}');
    
    // First, ensure the basic film info is cached
    await _databaseHelper.insert('films', {
      'id': filmDetail.id,
      'title': filmDetail.title,
      'original_title': filmDetail.originalTitle,
      'overview': filmDetail.overview,
      'poster_path': filmDetail.posterPath,
      'backdrop_path': filmDetail.backdropPath,
      'release_date': filmDetail.releaseDate,
      'popularity': filmDetail.popularity,
      'vote_average': filmDetail.voteAverage,
      'vote_count': filmDetail.voteCount,
      'adult': filmDetail.adult ? 1 : 0,
      'video': filmDetail.video ? 1 : 0,
      'original_language': filmDetail.originalLanguage,
      'genre_ids': jsonEncode(filmDetail.genres.map((g) => g.id).toList()),
    });
    
    // Save film details
    await _databaseHelper.insert('film_details', {
      'id': filmDetail.id,
      'budget': filmDetail.budget,
      'homepage': filmDetail.homepage,
      'imdb_id': filmDetail.imdbId,
      'revenue': filmDetail.revenue,
      'runtime': filmDetail.runtime,
      'status': filmDetail.status,
      'tagline': filmDetail.tagline,
      'belongs_to_collection_id': filmDetail.belongsToCollection?.id,
      'cached_at': DateTime.now().toIso8601String(),
    });
    
    // Save collection if it exists
    if (filmDetail.belongsToCollection != null) {
      await _databaseHelper.insert('collections', {
        'id': filmDetail.belongsToCollection!.id,
        'name': filmDetail.belongsToCollection!.name,
        'poster_path': filmDetail.belongsToCollection!.posterPath,
        'backdrop_path': filmDetail.belongsToCollection!.backdropPath,
      });
    }
    
    // Save genres
    for (final genre in filmDetail.genres) {
      // First ensure the genre exists
      await _databaseHelper.insert('genres', {
        'id': genre.id,
        'name': genre.name,
      });
      
      // Then save the film-genre relationship
      await _databaseHelper.insert('film_genres', {
        'film_id': filmDetail.id,
        'genre_id': genre.id,
      });
    }
    
    // Save production companies
    for (final company in filmDetail.productionCompanies) {
      await _databaseHelper.insert('production_companies', {
        'id': company.id,
        'name': company.name,
        'logo_path': company.logoPath,
        'origin_country': company.originCountry,
        'film_id': filmDetail.id,
      });
    }
    
    // Save production countries
    for (final country in filmDetail.productionCountries) {
      await _databaseHelper.insert('production_countries', {
        'iso_3166_1': country.iso31661,
        'name': country.name,
        'film_id': filmDetail.id,
      });
    }
    
    // Save spoken languages
    for (final language in filmDetail.spokenLanguages) {
      await _databaseHelper.insert('spoken_languages', {
        'iso_639_1': language.iso6391,
        'name': language.name,
        'english_name': language.englishName,
        'film_id': filmDetail.id,
      });
    }
  }

  Future<FilmDetailModel?> getFilmDetails(int filmId) async {
    // Get the basic film info
    final filmMaps = await _databaseHelper.query(
      'films',
      where: 'id = ?',
      whereArgs: [filmId],
      limit: 1,
    );
    
    if (filmMaps.isEmpty) return null;
    
    // Get the film details
    final detailMaps = await _databaseHelper.query(
      'film_details',
      where: 'id = ?',
      whereArgs: [filmId],
      limit: 1,
    );
    
    if (detailMaps.isEmpty) return null;
    
    final filmMap = filmMaps.first;
    final detailMap = detailMaps.first;
    
    // Get collection if it exists
    FilmCollection? collection;
    final collectionId = detailMap['belongs_to_collection_id'] as int?;
    if (collectionId != null) {
      final collectionMaps = await _databaseHelper.query(
        'collections',
        where: 'id = ?',
        whereArgs: [collectionId],
        limit: 1,
      );
      
      if (collectionMaps.isNotEmpty) {
        final collectionMap = collectionMaps.first;
        collection = FilmCollection(
          id: collectionMap['id'] as int,
          name: collectionMap['name'] as String,
          posterPath: collectionMap['poster_path'] as String?,
          backdropPath: collectionMap['backdrop_path'] as String?,
        );
      }
    }
    
    // Get genres
    final genreMaps = await _databaseHelper.query(
      'film_genres',
      columns: ['genre_id'],
      where: 'film_id = ?',
      whereArgs: [filmId],
    );
    
    final List<FilmGenre> genres = [];
    for (final genreMap in genreMaps) {
      final genreId = genreMap['genre_id'] as int;
      final genreDetailMaps = await _databaseHelper.query(
        'genres',
        where: 'id = ?',
        whereArgs: [genreId],
        limit: 1,
      );
      
      if (genreDetailMaps.isNotEmpty) {
        final genreDetailMap = genreDetailMaps.first;
        genres.add(FilmGenre(
          id: genreDetailMap['id'] as int,
          name: genreDetailMap['name'] as String,
        ));
      }
    }
    
    // Get production companies
    final companyMaps = await _databaseHelper.query(
      'production_companies',
      where: 'film_id = ?',
      whereArgs: [filmId],
    );
    
    final List<ProductionCompany> companies = companyMaps.map((map) => 
      ProductionCompany(
        id: map['id'] as int,
        name: map['name'] as String,
        logoPath: map['logo_path'] as String?,
        originCountry: map['origin_country'] as String,
      )
    ).toList();
    
    // Get production countries
    final countryMaps = await _databaseHelper.query(
      'production_countries',
      where: 'film_id = ?',
      whereArgs: [filmId],
    );
    
    final List<ProductionCountry> countries = countryMaps.map((map) => 
      ProductionCountry(
        iso31661: map['iso_3166_1'] as String,
        name: map['name'] as String,
      )
    ).toList();
    
    // Get spoken languages
    final languageMaps = await _databaseHelper.query(
      'spoken_languages',
      where: 'film_id = ?',
      whereArgs: [filmId],
    );
    
    final List<SpokenLanguage> languages = languageMaps.map((map) => 
      SpokenLanguage(
        iso6391: map['iso_639_1'] as String,
        name: map['name'] as String,
        englishName: map['english_name'] as String,
      )
    ).toList();
    
    // Create and return the film detail model
    return FilmDetailModel(
      id: filmMap['id'] as int,
      title: filmMap['title'] as String,
      originalTitle: filmMap['original_title'] as String,
      overview: filmMap['overview'] as String,
      posterPath: filmMap['poster_path'] as String?,
      backdropPath: filmMap['backdrop_path'] as String?,
      releaseDate: filmMap['release_date'] as String,
      popularity: filmMap['popularity'] as double,
      voteAverage: filmMap['vote_average'] as double,
      voteCount: filmMap['vote_count'] as int,
      adult: (filmMap['adult'] as int) == 1,
      video: (filmMap['video'] as int) == 1,
      originalLanguage: filmMap['original_language'] as String,
      budget: detailMap['budget'] as int,
      homepage: detailMap['homepage'] as String,
      imdbId: detailMap['imdb_id'] as String,
      revenue: detailMap['revenue'] as int,
      runtime: detailMap['runtime'] as int,
      status: detailMap['status'] as String,
      tagline: detailMap['tagline'] as String,
      belongsToCollection: collection,
      genres: genres,
      originCountry: filmMap['origin_country'] != null 
        ? List<String>.from(jsonDecode(filmMap['origin_country'] as String)) 
        : [],
      productionCompanies: companies,
      productionCountries: countries,
      spokenLanguages: languages,
    );
  }

  // Film credits methods
  Future<void> cacheFilmCredits(int filmId, FilmCreditsModel credits) async {
    print('Caching film credits for film ID: $filmId');
    
    // Save the timestamp for cache validation
    await _databaseHelper.insert('cache_timestamps', {
      'key': 'film_credits_$filmId',
      'timestamp': DateTime.now().toIso8601String(),
    });
    
    // Save cast members
    for (final castMember in credits.cast) {
      await _databaseHelper.insert('film_cast', {
        'id': castMember.id,
        'film_id': filmId,
        'name': castMember.name,
        'character': castMember.character,
        'profile_path': castMember.profilePath,
        'order_num': castMember.order,
      });
    }
    
    // Save crew members
    for (final crewMember in credits.crew) {
      await _databaseHelper.insert('film_crew', {
        'id': crewMember.id,
        'film_id': filmId,
        'name': crewMember.name,
        'department': crewMember.department,
        'job': crewMember.job,
        'profile_path': crewMember.profilePath,
      });
    }
  }

  Future<FilmCreditsModel?> getFilmCredits(int filmId) async {
    // Check if we have cached credits for this film
    final timestampMaps = await _databaseHelper.query(
      'cache_timestamps',
      where: 'key = ?',
      whereArgs: ['film_credits_$filmId'],
      limit: 1,
    );
    
    if (timestampMaps.isEmpty) return null;
    
    // Get cast members
    final castMaps = await _databaseHelper.query(
      'film_cast',
      where: 'film_id = ?',
      whereArgs: [filmId],
      orderBy: 'order_num ASC',
    );
    
    // Get crew members
    final crewMaps = await _databaseHelper.query(
      'film_crew',
      where: 'film_id = ?',
      whereArgs: [filmId],
    );
    
    if (castMaps.isEmpty && crewMaps.isEmpty) return null;
    
    // Map cast data to FilmCastModel objects
    final List<FilmCastModel> cast = castMaps.map((map) => FilmCastModel(
      adult: false, // This field isn't stored in the database, defaulting to false
      gender: 0, // This field isn't stored in the database, defaulting to 0
      id: map['id'] as int,
      knownForDepartment: '', // This field isn't stored in the database, defaulting to empty string
      name: map['name'] as String,
      originalName: map['name'] as String, // Using name as originalName since it's not stored separately
      popularity: 0.0, // This field isn't stored in the database, defaulting to 0.0
      profilePath: map['profile_path'] as String?,
      castId: 0, // This field isn't stored in the database, defaulting to 0
      character: map['character'] as String,
      creditId: '', // This field isn't stored in the database, defaulting to empty string
      order: map['order_num'] as int,
    )).toList();
    
    // Map crew data to FilmCrewModel objects
    final List<FilmCrewModel> crew = crewMaps.map((map) => FilmCrewModel(
      adult: false, // This field isn't stored in the database, defaulting to false
      gender: 0, // This field isn't stored in the database, defaulting to 0
      id: map['id'] as int,
      knownForDepartment: '', // This field isn't stored in the database, defaulting to empty string
      name: map['name'] as String,
      originalName: map['name'] as String, // Using name as originalName since it's not stored separately
      popularity: 0.0, // This field isn't stored in the database, defaulting to 0.0
      profilePath: map['profile_path'] as String?,
      creditId: '', // This field isn't stored in the database, defaulting to empty string
      department: map['department'] as String,
      job: map['job'] as String,
    )).toList();
    
    // Create and return the FilmCreditsModel
    return FilmCreditsModel(
      id: filmId.toString(),
      cast: cast,
      crew: crew,
    );
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
  
  // Genre methods
  Future<void> cacheGenres(GenreListModel genreList) async {
    print('Caching ${genreList.genres.length} genres');
    
    // Save each genre
    for (final genre in genreList.genres) {
      await _databaseHelper.insert('genres', {
        'id': genre.id,
        'name': genre.name,
      });
    }
    
    // Save the timestamp for cache validation
    await _databaseHelper.insert('cache_timestamps', {
      'key': 'genres',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  Future<GenreListModel?> getGenres() async {
    
    // Get all genres from the database
    final genreMaps = await _databaseHelper.query('genres');
    
    if (genreMaps.isEmpty) return null;
    
    final genres = genreMaps.map((map) => Genre(
      id: map['id'] as int,
      name: map['name'] as String,
    )).toList();
    
    return GenreListModel(genres: genres);
  }

  Future<Genre?> getGenreById(int genreId) async {
    // Get the specific genre from the database
    final genreMaps = await _databaseHelper.query(
      'genres',
      where: 'id = ?',
      whereArgs: [genreId],
      limit: 1,
    );
    
    if (genreMaps.isEmpty) return null;
    
    return Genre(
      id: genreMaps.first['id'] as int,
      name: genreMaps.first['name'] as String,
    );
  }

  Future<void> cacheSimilarFilms(int filmId, FilmListModel filmList) async {
    await cacheFilmList('similar_$filmId', filmList);
  }
  
  Future<FilmListModel?> getSimilarFilms(int filmId) async {
    return await getFilmList('similar_$filmId');
  }
  
  Future<void> cacheRecommendedFilms(int filmId, FilmListModel filmList) async {
    await cacheFilmList('recommended_$filmId', filmList);
  }
  
  Future<FilmListModel?> getRecommendedFilms(int filmId) async {
    return await getFilmList('recommended_$filmId');
  }
}
