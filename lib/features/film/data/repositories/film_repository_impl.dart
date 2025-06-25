import 'package:film_magic/core/errors/failures.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/film/data/datasources/film_local_data_source.dart';
import 'package:film_magic/features/film/data/datasources/film_remote_data_source.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

import '../models/genre_list_model.dart';

class FilmRepositoryImpl implements FilmRepository {
  final NetworkInfo _networkInfo;
  final FilmLocalDataSource _localDataSource;
  final FilmRemoteDataSource _remoteDataSource;

  FilmRepositoryImpl({
    required NetworkInfo networkInfo,
    required FilmLocalDataSource localDataSource,
    required FilmRemoteDataSource remoteDataSource,
  }) : _networkInfo = networkInfo,
       _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  /// Checks if the device is connected to the internet
  /// Returns true if connected, false otherwise
  Future<bool> _isConnected() async {
    return await _networkInfo.isConnected;
  }

  @override
  Future<FilmListModel> getNowPlayingFilms() async {
    try {
      // Check if we're online
      final isConnected = await _isConnected();

      // If we're online, try to fetch from remote data source first
      if (isConnected) {
        try {
          final filmList = await _remoteDataSource.getNowPlayingFilms();

          // Cache the results
          await _localDataSource.cacheFilmList('now_playing', filmList);

          return filmList;
        } catch (e) {
          // If remote data source fails, try to get from local data source
          final cachedData = await _localDataSource.getFilmList('now_playing');
          if (cachedData != null) {
            return cachedData;
          }

          // If no cache, rethrow the original error
          rethrow;
        }
      } else {
        // We're offline, try to get from local data source
        final cachedData = await _localDataSource.getFilmList('now_playing');
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, throw network failure
        throw NetworkFailure(
          message: 'No internet connection and no cached data available',
        );
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmListModel> getPopularFilms() async {
    try {
      // Try to get data from remote data source first
      try {
        final filmList = await _remoteDataSource.getPopularFilms();

        // Cache the results
        await _localDataSource.cacheFilmList('popular', filmList);

        return filmList;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getFilmList('popular');
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmListModel> getTopRatedFilms() async {
    try {
      // Try to get data from remote data source first
      try {
        final filmList = await _remoteDataSource.getTopRatedFilms();

        // Cache the results
        await _localDataSource.cacheFilmList('top_rated', filmList);

        return filmList;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getFilmList('top_rated');
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmListModel> getUpcomingFilms() async {
    try {
      // Try to get data from remote data source first
      try {
        final filmList = await _remoteDataSource.getUpcomingFilms();

        // Cache the results
        await _localDataSource.cacheFilmList('upcoming', filmList);

        return filmList;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getFilmList('upcoming');
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmDetailModel> getFilmDetails(int filmId) async {
    try {
      // Try to get data from remote data source first
      try {
        final filmDetail = await _remoteDataSource.getFilmDetails(filmId);

        // Cache the results (assuming the method is implemented)
        await _localDataSource.cacheFilmDetails(filmDetail);

        return filmDetail;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getFilmDetails(filmId);
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmCreditsModel> getFilmCredits(int filmId) async {
    try {
      // Try to get data from remote data source first
      try {
        final filmCredits = await _remoteDataSource.getFilmCredits(filmId);

        // Cache the results (assuming the method is implemented)
        await _localDataSource.cacheFilmCredits(filmId, filmCredits);

        return filmCredits;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getFilmCredits(filmId);
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<GenreListModel> getGenres() async {
    try {
      // Check if we're online
      final isConnected = await _isConnected();

      // If we're online, try to fetch from remote data source first
      if (isConnected) {
        try {
          final genreList = await _remoteDataSource.getGenres();

          // Cache the results
          await _localDataSource.cacheGenres(genreList);

          return genreList;
        } catch (e) {
          // If remote data source fails, try to get from local data source
          final cachedData = await _localDataSource.getGenres();
          if (cachedData != null) {
            return cachedData;
          }

          // If no cache, rethrow the original error
          rethrow;
        }
      } else {
        // We're offline, try to get from local data source
        final cachedData = await _localDataSource.getGenres();
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, throw network failure
        throw NetworkFailure(
          message: 'No internet connection and no cached data available',
        );
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<Genre> getGenreById(int genreId) async {
    try {
      // Try to get from local data source first since it's more efficient
      final cachedGenre = await _localDataSource.getGenreById(genreId);
      if (cachedGenre != null) {
        return cachedGenre;
      }

      // If not in cache, fetch all genres and find the one we need
      final genreList = await getGenres();
      final genre = genreList.genres.firstWhere(
        (genre) => genre.id == genreId,
        orElse: () => throw ServerFailure(message: 'Genre not found'),
      );

      return genre;
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmListModel> getSimilarFilms(int filmId) async {
    try {
      // Try to get data from remote data source first
      try {
        final filmList = await _remoteDataSource.getSimilarFilms(filmId);

        // Cache the results
        await _localDataSource.cacheSimilarFilms(filmId, filmList);

        return filmList;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getSimilarFilms(filmId);
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<FilmListModel> getRecommendedFilms(int filmId) async {
    try {
      // Try to get data from remote data source first
      try {
        final filmList = await _remoteDataSource.getRecommendedFilms(filmId);

        // Cache the results
        await _localDataSource.cacheRecommendedFilms(filmId, filmList);

        return filmList;
      } catch (e) {
        // If remote data source fails, try to get from local data source
        final cachedData = await _localDataSource.getRecommendedFilms(filmId);
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, rethrow the original error
        rethrow;
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }
}
