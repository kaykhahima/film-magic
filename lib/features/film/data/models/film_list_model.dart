import 'package:dart_mappable/dart_mappable.dart';

part 'film_list_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class FilmListModel with FilmListModelMappable {
  final DateTimeRange? dates;
  final List<FilmModel> results;
  final int page;
  final int totalPages;
  final int totalResults;

  FilmListModel({
    this.dates,
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class DateTimeRange with DateTimeRangeMappable {
  final String maximum;
  final String minimum;

  DateTimeRange({required this.maximum, required this.minimum});
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class FilmModel with FilmModelMappable {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  FilmModel({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
