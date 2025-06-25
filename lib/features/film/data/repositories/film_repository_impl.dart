import 'package:film_magic/core/constants/api_constants.dart';
import 'package:film_magic/core/errors/failures.dart';
import 'package:film_magic/core/network/api_client.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository.dart';

class FilmRepositoryImpl implements FilmRepository {
  final ApiClient _apiClient;
  final NetworkInfo _networkInfo;

  FilmRepositoryImpl(this._apiClient, this._networkInfo);

  /// Checks if the device is connected to the internet
  /// Throws a NetworkFailure if not connected
  Future<void> _checkNetworkConnection() async {
    if (!await _networkInfo.isConnected) {
      throw NetworkFailure(message: 'No internet connection');
    }
  }

  @override
  Future<FilmListModel> getNowPlayingFilms() async {
    try {
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        ApiConstants.nowPlayingEndpoint,
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
          ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
        },
      );

      return FilmListModelMapper.fromMap(response);
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
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        ApiConstants.popularEndpoint,
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
          ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
        },
      );

      return FilmListModelMapper.fromMap(response);
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
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        ApiConstants.topRatedEndpoint,
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
          ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
        },
      );

      return FilmListModelMapper.fromMap(response);
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
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        ApiConstants.upcomingEndpoint,
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
          ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
        },
      );

      return FilmListModelMapper.fromMap(response);
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
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        '${ApiConstants.movieDetailsEndpoint}$filmId',
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
        },
      );

      return FilmDetailModelMapper.fromMap(response);
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
      await _checkNetworkConnection();

      final response = await _apiClient.get(
        '${ApiConstants.movieDetailsEndpoint}$filmId/credits',
        queryParameters: {
          ApiConstants.languageParam: ApiConstants.defaultLanguage,
        },
      );

      return FilmCreditsModelMapper.fromMap(response);
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }
}
