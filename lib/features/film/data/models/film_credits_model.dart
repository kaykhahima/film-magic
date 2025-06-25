import 'package:dart_mappable/dart_mappable.dart';

part 'film_credits_model.mapper.dart';

@MappableClass()
class FilmCreditsModel with FilmCreditsModelMappable {
  final String id;
  final List<FilmCastModel> cast;
  final List<FilmCrewModel> crew;

  FilmCreditsModel({required this.id, required this.cast, required this.crew});
}

@MappableClass()
class FilmCastModel with FilmCastModelMappable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  FilmCastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });
}

@MappableClass()
class FilmCrewModel with FilmCrewModelMappable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String creditId;
  final String department;
  final String job;

  FilmCrewModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });
}
