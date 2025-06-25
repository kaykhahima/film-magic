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
  @MappableField(key: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @MappableField(key: 'original_name')
  final String originalName;
  final double popularity;
  @MappableField(key: 'profile_path')
  final String? profilePath;
  @MappableField(key: 'cast_id')
  final int castId;
  final String character;
  @MappableField(key: 'credit_id')
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
    this.profilePath,
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
  @MappableField(key: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @MappableField(key: 'original_name')
  final String originalName;
  final double popularity;
  @MappableField(key: 'profile_path')
  final String? profilePath;
  @MappableField(key: 'credit_id')
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
    this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });
}
