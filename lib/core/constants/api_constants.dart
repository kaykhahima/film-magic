class ApiConstants {
  // Base URL
  static const String tmdbBaseUrl = 'https://api.themoviedb.org/3/';

  // Endpoints
  static const String personEndpoint = 'person/';

  // Movie Specific Endpoints
  static const String nowPlayingEndpoint = 'movie/now_playing';
  static const String popularEndpoint = 'movie/popular';
  static const String topRatedEndpoint = 'movie/top_rated';
  static const String upcomingEndpoint = 'movie/upcoming';
  static const String movieDetailsEndpoint = 'movie/'; // Append movie_id
  static const String movieCreditsEndpoint =
      'movie/'; // Append movie_id/credits
  static const String movieSimilarEndpoint =
      'movie/'; // Append movie_id/similar
  static const String genreListEndpoint = 'genre/movie/list';

  // Headers
  static const String authorizationHeader = 'Authorization';
  static const String acceptHeader = 'accept';
  static const String contentTypeHeader = 'Content-Type';

  // Header Values
  static const String acceptValue = 'application/json';
  static const String contentTypeValue = 'application/json';

  // Query Parameters
  static const String languageParam = 'language';
  static const String pageParam = 'page';

  // Default Values
  static const String defaultLanguage = 'en-US';
  static const int defaultPage = 1;
}
