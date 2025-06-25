import 'package:dart_mappable/dart_mappable.dart';

part 'film_list_model.mapper.dart';

@MappableClass()
class FilmListModel with FilmListModelMappable {
  @MappableField(key: 'dates')
  final DateTimeRange? dates;

  @MappableField(key: 'results')
  final List<FilmModel> results;

  @MappableField(key: 'page')
  final int page;

  @MappableField(key: 'total_pages')
  final int totalPages;

  @MappableField(key: 'total_results')
  final int totalResults;

  FilmListModel({
    this.dates,
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });
}

@MappableClass()
class DateTimeRange with DateTimeRangeMappable {
  final String maximum;
  final String minimum;

  DateTimeRange({required this.maximum, required this.minimum});
}

@MappableClass()
class FilmModel with FilmModelMappable {
  @MappableField(key: 'adult')
  final bool adult;

  @MappableField(key: 'backdrop_path')
  final String backdropPath;

  @MappableField(key: 'genre_ids')
  final List<int> genreIds;

  @MappableField(key: 'id')
  final int id;

  @MappableField(key: 'original_language')
  final String originalLanguage;

  @MappableField(key: 'original_title')
  final String originalTitle;

  @MappableField(key: 'overview')
  final String overview;

  @MappableField(key: 'popularity')
  final double popularity;

  @MappableField(key: 'poster_path')
  final String posterPath;

  @MappableField(key: 'release_date')
  final String releaseDate;

  @MappableField(key: 'title')
  final String title;

  @MappableField(key: 'video')
  final bool video;

  @MappableField(key: 'vote_average')
  final double voteAverage;

  @MappableField(key: 'vote_count')
  final int voteCount;

  FilmModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
