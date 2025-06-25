import 'package:dart_mappable/dart_mappable.dart';

part 'film_detail_model.mapper.dart';

@MappableClass()
class FilmDetailModel with FilmDetailModelMappable {
  final bool adult;
  final String backdropPath;
  final FilmCollection? belongsToCollection;
  final int budget;
  final List<FilmGenre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  FilmDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}

@MappableClass()
class FilmCollection with FilmCollectionMappable {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  FilmCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });
}

@MappableClass()
class FilmGenre with FilmGenreMappable {
  final int id;
  final String name;

  FilmGenre({required this.id, required this.name});
}

@MappableClass()
class ProductionCompany with ProductionCompanyMappable {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}

@MappableClass()
class ProductionCountry with ProductionCountryMappable {
  final String iso31661;
  final String name;

  ProductionCountry({required this.iso31661, required this.name});
}

@MappableClass()
class SpokenLanguage with SpokenLanguageMappable {
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
}
