import 'package:dart_mappable/dart_mappable.dart';

part 'actor_detail_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ActorDetailModel with ActorDetailModelMappable {
  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final String birthday;
  final String? deathday;
  final int gender;
  final String? homepage;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  ActorDetailModel({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });
}
