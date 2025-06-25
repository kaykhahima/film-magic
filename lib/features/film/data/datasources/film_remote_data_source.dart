import 'package:film_magic/core/constants/api_constants.dart';
import 'package:film_magic/core/network/api_client.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';

class FilmRemoteDataSource {
  final ApiClient _apiClient;

  FilmRemoteDataSource(this._apiClient);

  Future<FilmListModel> getNowPlayingFilms() async {
    final response = await _apiClient.get(
      ApiConstants.nowPlayingEndpoint,
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
        ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
      },
    );

    return FilmListModelMapper.fromMap(response);
  }

  Future<FilmListModel> getPopularFilms() async {
    final response = await _apiClient.get(
      ApiConstants.popularEndpoint,
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
        ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
      },
    );

    return FilmListModelMapper.fromMap(response);
  }

  Future<FilmListModel> getTopRatedFilms() async {
    final response = await _apiClient.get(
      ApiConstants.topRatedEndpoint,
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
        ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
      },
    );

    return FilmListModelMapper.fromMap(response);
  }

  Future<FilmListModel> getUpcomingFilms() async {
    final response = await _apiClient.get(
      ApiConstants.upcomingEndpoint,
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
        ApiConstants.pageParam: ApiConstants.defaultPage.toString(),
      },
    );

    return FilmListModelMapper.fromMap(response);
  }

  Future<FilmDetailModel> getFilmDetails(int filmId) async {
    final response = await _apiClient.get(
      '${ApiConstants.movieDetailsEndpoint}$filmId',
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
      },
    );

    return FilmDetailModelMapper.fromMap(response);
  }

  Future<FilmCreditsModel> getFilmCredits(int filmId) async {
    final response = await _apiClient.get(
      '${ApiConstants.movieDetailsEndpoint}$filmId/credits',
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
      },
    );

    return FilmCreditsModelMapper.fromMap(response);
  }
}