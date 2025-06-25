import 'package:dart_mappable/dart_mappable.dart';

part 'film_detail_model.mapper.dart';

@MappableClass()
class FilmDetailModel with FilmDetailModelMappable {
  final bool adult;
  @MappableField(key: 'backdrop_path')
  final String backdropPath;
  @MappableField(key: 'belongs_to_collection')
  final FilmCollection? belongsToCollection;
  final int budget;
  final List<FilmGenre> genres;
  final String homepage;
  final int id;
  @MappableField(key: 'imdb_id')
  final String imdbId;
  @MappableField(key: 'origin_country')
  final List<String> originCountry;
  @MappableField(key: 'original_language')
  final String originalLanguage;
  @MappableField(key: 'original_title')
  final String originalTitle;
  final String overview;
  final double popularity;
  @MappableField(key: 'poster_path')
  final String posterPath;
  @MappableField(key: 'production_companies')
  final List<ProductionCompany> productionCompanies;
  @MappableField(key: 'production_countries')
  final List<ProductionCountry> productionCountries;
  @MappableField(key: 'release_date')
  final String releaseDate;
  final int revenue;
  final int runtime;
  @MappableField(key: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  @MappableField(key: 'vote_average')
  final double voteAverage;
  @MappableField(key: 'vote_count')
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
  @MappableField(key: 'poster_path')
  final String posterPath;
  @MappableField(key: 'backdrop_path')
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
  @MappableField(key: 'logo_path')
  final String? logoPath;
  final String name;
  @MappableField(key: 'origin_country')
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
  @MappableField(key: 'iso_3166_1')
  final String iso31661;
  final String name;

  ProductionCountry({required this.iso31661, required this.name});
}

@MappableClass()
class SpokenLanguage with SpokenLanguageMappable {
  @MappableField(key: 'english_name')
  final String englishName;
  @MappableField(key: 'iso_639_1')
  final String iso6391;
  final String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });
}
