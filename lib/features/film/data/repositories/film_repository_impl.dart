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

  // Cache the network status to avoid multiple checks
  bool? _isNetworkConnected;

  FilmRepositoryImpl({
    required NetworkInfo networkInfo,
    required FilmLocalDataSource localDataSource,
    required FilmRemoteDataSource remoteDataSource,
  }) : _networkInfo = networkInfo,
       _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  /// Checks if the device is connected to the internet
  /// Returns true if connected, false otherwise
  /// This method caches the result to avoid multiple network checks
  Future<bool> _isConnected() async {
    if (_isNetworkConnected != null) {
      return _isNetworkConnected!;
    }

    // Check network status and cache the result
    _isNetworkConnected = await _networkInfo.isConnected;
    return _isNetworkConnected!;
  }

  /// Generic method to fetch data with network awareness
  /// This reduces code duplication across repository methods
  Future<T> _getDataWithNetworkCheck<T>({
    required Future<T> Function() remoteDataFetch,
    required Future<T?> Function() localDataFetch,
    required Future<void> Function(T) cacheData,
    String? errorMessage,
  }) async {
    try {
      // Check if we're online (using cached value if available)
      final isConnected = await _isConnected();

      if (isConnected) {
        try {
          // Try to fetch from remote data source
          final data = await remoteDataFetch();

          // Cache the results
          await cacheData(data);

          return data;
        } catch (e) {
          // If remote data source fails, try to get from local data source
          final cachedData = await localDataFetch();
          if (cachedData != null) {
            return cachedData;
          }

          // If no cache, rethrow the original error
          rethrow;
        }
      } else {
        // We're offline, try to get from local data source
        final cachedData = await localDataFetch();
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, throw network failure
        throw NetworkFailure(
          message:
              errorMessage ??
              'No internet connection and no cached data available',
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
  Future<FilmListModel> getNowPlayingFilms() async {
    return _getDataWithNetworkCheck<FilmListModel>(
      remoteDataFetch: () => _remoteDataSource.getNowPlayingFilms(),
      localDataFetch: () => _localDataSource.getFilmList('now_playing'),
      cacheData: (data) => _localDataSource.cacheFilmList('now_playing', data),
    );
  }

  @override
  Future<FilmListModel> getPopularFilms() async {
    return _getDataWithNetworkCheck<FilmListModel>(
      remoteDataFetch: () => _remoteDataSource.getPopularFilms(),
      localDataFetch: () => _localDataSource.getFilmList('popular'),
      cacheData: (data) => _localDataSource.cacheFilmList('popular', data),
    );
  }

  @override
  Future<FilmListModel> getTopRatedFilms() async {
    return _getDataWithNetworkCheck<FilmListModel>(
      remoteDataFetch: () => _remoteDataSource.getTopRatedFilms(),
      localDataFetch: () => _localDataSource.getFilmList('top_rated'),
      cacheData: (data) => _localDataSource.cacheFilmList('top_rated', data),
    );
  }

  @override
  Future<FilmListModel> getUpcomingFilms() async {
    return _getDataWithNetworkCheck<FilmListModel>(
      remoteDataFetch: () => _remoteDataSource.getUpcomingFilms(),
      localDataFetch: () => _localDataSource.getFilmList('upcoming'),
      cacheData: (data) => _localDataSource.cacheFilmList('upcoming', data),
    );
  }

  @override
  Future<FilmDetailModel> getFilmDetails(int filmId) async {
    return _getDataWithNetworkCheck<FilmDetailModel>(
      remoteDataFetch: () => _remoteDataSource.getFilmDetails(filmId),
      localDataFetch: () => _localDataSource.getFilmDetails(filmId),
      cacheData: (data) => _localDataSource.cacheFilmDetails(data),
    );
  }

  @override
  Future<FilmCreditsModel> getFilmCredits(int filmId) async {
    return _getDataWithNetworkCheck<FilmCreditsModel>(
      remoteDataFetch: () => _remoteDataSource.getFilmCredits(filmId),
      localDataFetch: () => _localDataSource.getFilmCredits(filmId),
      cacheData: (data) => _localDataSource.cacheFilmCredits(filmId, data),
    );
  }

  @override
  Future<GenreListModel> getGenres() async {
    return _getDataWithNetworkCheck<GenreListModel>(
      remoteDataFetch: () => _remoteDataSource.getGenres(),
      localDataFetch: () => _localDataSource.getGenres(),
      cacheData: (data) => _localDataSource.cacheGenres(data),
    );
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
    return _getDataWithNetworkCheck<FilmListModel>(
      remoteDataFetch: () => _remoteDataSource.getSimilarFilms(filmId),
      localDataFetch: () => _localDataSource.getSimilarFilms(filmId),
      cacheData: (data) => _localDataSource.cacheSimilarFilms(filmId, data),
    );
  }
}
