import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/models/genre_list_model.dart';

abstract class FilmRepository {
  /// Retrieves a list of films currently playing in theaters
  Future<FilmListModel> getNowPlayingFilms();

  /// Retrieves a list of popular films
  Future<FilmListModel> getPopularFilms();

  /// Retrieves a list of top rated films
  Future<FilmListModel> getTopRatedFilms();

  /// Retrieves a list of upcoming films
  Future<FilmListModel> getUpcomingFilms();

  /// Retrieves detailed information for a specific film
  ///
  /// [filmId] - The ID of the film to retrieve details for
  Future<FilmDetailModel> getFilmDetails(int filmId);

  /// Retrieves credits (cast and crew) for a specific film
  ///
  /// [filmId] - The ID of the film to retrieve credits for
  Future<FilmCreditsModel> getFilmCredits(int filmId);
  
  /// Retrieves a list of all movie genres
  Future<GenreListModel> getGenres();
  
  /// Retrieves a specific genre by its ID
  ///
  /// [genreId] - The ID of the genre to retrieve
  Future<Genre> getGenreById(int genreId);
}
