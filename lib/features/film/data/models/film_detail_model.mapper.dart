// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'film_detail_model.dart';

class FilmDetailModelMapper extends ClassMapperBase<FilmDetailModel> {
  FilmDetailModelMapper._();

  static FilmDetailModelMapper? _instance;
  static FilmDetailModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmDetailModelMapper._());
      FilmCollectionMapper.ensureInitialized();
      FilmGenreMapper.ensureInitialized();
      ProductionCompanyMapper.ensureInitialized();
      ProductionCountryMapper.ensureInitialized();
      SpokenLanguageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilmDetailModel';

  static bool _$adult(FilmDetailModel v) => v.adult;
  static const Field<FilmDetailModel, bool> _f$adult = Field('adult', _$adult);
  static String? _$backdropPath(FilmDetailModel v) => v.backdropPath;
  static const Field<FilmDetailModel, String> _f$backdropPath =
      Field('backdropPath', _$backdropPath, key: r'backdrop_path', opt: true);
  static FilmCollection? _$belongsToCollection(FilmDetailModel v) =>
      v.belongsToCollection;
  static const Field<FilmDetailModel, FilmCollection> _f$belongsToCollection =
      Field('belongsToCollection', _$belongsToCollection,
          key: r'belongs_to_collection');
  static int _$budget(FilmDetailModel v) => v.budget;
  static const Field<FilmDetailModel, int> _f$budget =
      Field('budget', _$budget);
  static List<FilmGenre> _$genres(FilmDetailModel v) => v.genres;
  static const Field<FilmDetailModel, List<FilmGenre>> _f$genres =
      Field('genres', _$genres);
  static String _$homepage(FilmDetailModel v) => v.homepage;
  static const Field<FilmDetailModel, String> _f$homepage =
      Field('homepage', _$homepage);
  static int _$id(FilmDetailModel v) => v.id;
  static const Field<FilmDetailModel, int> _f$id = Field('id', _$id);
  static String _$imdbId(FilmDetailModel v) => v.imdbId;
  static const Field<FilmDetailModel, String> _f$imdbId =
      Field('imdbId', _$imdbId, key: r'imdb_id');
  static List<String> _$originCountry(FilmDetailModel v) => v.originCountry;
  static const Field<FilmDetailModel, List<String>> _f$originCountry =
      Field('originCountry', _$originCountry, key: r'origin_country');
  static String _$originalLanguage(FilmDetailModel v) => v.originalLanguage;
  static const Field<FilmDetailModel, String> _f$originalLanguage =
      Field('originalLanguage', _$originalLanguage, key: r'original_language');
  static String _$originalTitle(FilmDetailModel v) => v.originalTitle;
  static const Field<FilmDetailModel, String> _f$originalTitle =
      Field('originalTitle', _$originalTitle, key: r'original_title');
  static String _$overview(FilmDetailModel v) => v.overview;
  static const Field<FilmDetailModel, String> _f$overview =
      Field('overview', _$overview);
  static double _$popularity(FilmDetailModel v) => v.popularity;
  static const Field<FilmDetailModel, double> _f$popularity =
      Field('popularity', _$popularity);
  static String? _$posterPath(FilmDetailModel v) => v.posterPath;
  static const Field<FilmDetailModel, String> _f$posterPath =
      Field('posterPath', _$posterPath, key: r'poster_path', opt: true);
  static List<ProductionCompany> _$productionCompanies(FilmDetailModel v) =>
      v.productionCompanies;
  static const Field<FilmDetailModel, List<ProductionCompany>>
      _f$productionCompanies = Field(
          'productionCompanies', _$productionCompanies,
          key: r'production_companies');
  static List<ProductionCountry> _$productionCountries(FilmDetailModel v) =>
      v.productionCountries;
  static const Field<FilmDetailModel, List<ProductionCountry>>
      _f$productionCountries = Field(
          'productionCountries', _$productionCountries,
          key: r'production_countries');
  static String _$releaseDate(FilmDetailModel v) => v.releaseDate;
  static const Field<FilmDetailModel, String> _f$releaseDate =
      Field('releaseDate', _$releaseDate, key: r'release_date');
  static int _$revenue(FilmDetailModel v) => v.revenue;
  static const Field<FilmDetailModel, int> _f$revenue =
      Field('revenue', _$revenue);
  static int _$runtime(FilmDetailModel v) => v.runtime;
  static const Field<FilmDetailModel, int> _f$runtime =
      Field('runtime', _$runtime);
  static List<SpokenLanguage> _$spokenLanguages(FilmDetailModel v) =>
      v.spokenLanguages;
  static const Field<FilmDetailModel, List<SpokenLanguage>> _f$spokenLanguages =
      Field('spokenLanguages', _$spokenLanguages, key: r'spoken_languages');
  static String _$status(FilmDetailModel v) => v.status;
  static const Field<FilmDetailModel, String> _f$status =
      Field('status', _$status);
  static String _$tagline(FilmDetailModel v) => v.tagline;
  static const Field<FilmDetailModel, String> _f$tagline =
      Field('tagline', _$tagline);
  static String _$title(FilmDetailModel v) => v.title;
  static const Field<FilmDetailModel, String> _f$title =
      Field('title', _$title);
  static bool _$video(FilmDetailModel v) => v.video;
  static const Field<FilmDetailModel, bool> _f$video = Field('video', _$video);
  static double _$voteAverage(FilmDetailModel v) => v.voteAverage;
  static const Field<FilmDetailModel, double> _f$voteAverage =
      Field('voteAverage', _$voteAverage, key: r'vote_average');
  static int _$voteCount(FilmDetailModel v) => v.voteCount;
  static const Field<FilmDetailModel, int> _f$voteCount =
      Field('voteCount', _$voteCount, key: r'vote_count');

  @override
  final MappableFields<FilmDetailModel> fields = const {
    #adult: _f$adult,
    #backdropPath: _f$backdropPath,
    #belongsToCollection: _f$belongsToCollection,
    #budget: _f$budget,
    #genres: _f$genres,
    #homepage: _f$homepage,
    #id: _f$id,
    #imdbId: _f$imdbId,
    #originCountry: _f$originCountry,
    #originalLanguage: _f$originalLanguage,
    #originalTitle: _f$originalTitle,
    #overview: _f$overview,
    #popularity: _f$popularity,
    #posterPath: _f$posterPath,
    #productionCompanies: _f$productionCompanies,
    #productionCountries: _f$productionCountries,
    #releaseDate: _f$releaseDate,
    #revenue: _f$revenue,
    #runtime: _f$runtime,
    #spokenLanguages: _f$spokenLanguages,
    #status: _f$status,
    #tagline: _f$tagline,
    #title: _f$title,
    #video: _f$video,
    #voteAverage: _f$voteAverage,
    #voteCount: _f$voteCount,
  };

  static FilmDetailModel _instantiate(DecodingData data) {
    return FilmDetailModel(
        adult: data.dec(_f$adult),
        backdropPath: data.dec(_f$backdropPath),
        belongsToCollection: data.dec(_f$belongsToCollection),
        budget: data.dec(_f$budget),
        genres: data.dec(_f$genres),
        homepage: data.dec(_f$homepage),
        id: data.dec(_f$id),
        imdbId: data.dec(_f$imdbId),
        originCountry: data.dec(_f$originCountry),
        originalLanguage: data.dec(_f$originalLanguage),
        originalTitle: data.dec(_f$originalTitle),
        overview: data.dec(_f$overview),
        popularity: data.dec(_f$popularity),
        posterPath: data.dec(_f$posterPath),
        productionCompanies: data.dec(_f$productionCompanies),
        productionCountries: data.dec(_f$productionCountries),
        releaseDate: data.dec(_f$releaseDate),
        revenue: data.dec(_f$revenue),
        runtime: data.dec(_f$runtime),
        spokenLanguages: data.dec(_f$spokenLanguages),
        status: data.dec(_f$status),
        tagline: data.dec(_f$tagline),
        title: data.dec(_f$title),
        video: data.dec(_f$video),
        voteAverage: data.dec(_f$voteAverage),
        voteCount: data.dec(_f$voteCount));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmDetailModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmDetailModel>(map);
  }

  static FilmDetailModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmDetailModel>(json);
  }
}

mixin FilmDetailModelMappable {
  String toJson() {
    return FilmDetailModelMapper.ensureInitialized()
        .encodeJson<FilmDetailModel>(this as FilmDetailModel);
  }

  Map<String, dynamic> toMap() {
    return FilmDetailModelMapper.ensureInitialized()
        .encodeMap<FilmDetailModel>(this as FilmDetailModel);
  }

  FilmDetailModelCopyWith<FilmDetailModel, FilmDetailModel, FilmDetailModel>
      get copyWith => _FilmDetailModelCopyWithImpl(
          this as FilmDetailModel, $identity, $identity);
  @override
  String toString() {
    return FilmDetailModelMapper.ensureInitialized()
        .stringifyValue(this as FilmDetailModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmDetailModelMapper.ensureInitialized()
        .equalsValue(this as FilmDetailModel, other);
  }

  @override
  int get hashCode {
    return FilmDetailModelMapper.ensureInitialized()
        .hashValue(this as FilmDetailModel);
  }
}

extension FilmDetailModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmDetailModel, $Out> {
  FilmDetailModelCopyWith<$R, FilmDetailModel, $Out> get $asFilmDetailModel =>
      $base.as((v, t, t2) => _FilmDetailModelCopyWithImpl(v, t, t2));
}

abstract class FilmDetailModelCopyWith<$R, $In extends FilmDetailModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  FilmCollectionCopyWith<$R, FilmCollection, FilmCollection>?
      get belongsToCollection;
  ListCopyWith<$R, FilmGenre, FilmGenreCopyWith<$R, FilmGenre, FilmGenre>>
      get genres;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get originCountry;
  ListCopyWith<$R, ProductionCompany,
          ProductionCompanyCopyWith<$R, ProductionCompany, ProductionCompany>>
      get productionCompanies;
  ListCopyWith<$R, ProductionCountry,
          ProductionCountryCopyWith<$R, ProductionCountry, ProductionCountry>>
      get productionCountries;
  ListCopyWith<$R, SpokenLanguage,
          SpokenLanguageCopyWith<$R, SpokenLanguage, SpokenLanguage>>
      get spokenLanguages;
  $R call(
      {bool? adult,
      String? backdropPath,
      FilmCollection? belongsToCollection,
      int? budget,
      List<FilmGenre>? genres,
      String? homepage,
      int? id,
      String? imdbId,
      List<String>? originCountry,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      List<ProductionCompany>? productionCompanies,
      List<ProductionCountry>? productionCountries,
      String? releaseDate,
      int? revenue,
      int? runtime,
      List<SpokenLanguage>? spokenLanguages,
      String? status,
      String? tagline,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount});
  FilmDetailModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilmDetailModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmDetailModel, $Out>
    implements FilmDetailModelCopyWith<$R, FilmDetailModel, $Out> {
  _FilmDetailModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmDetailModel> $mapper =
      FilmDetailModelMapper.ensureInitialized();
  @override
  FilmCollectionCopyWith<$R, FilmCollection, FilmCollection>?
      get belongsToCollection => $value.belongsToCollection?.copyWith
          .$chain((v) => call(belongsToCollection: v));
  @override
  ListCopyWith<$R, FilmGenre, FilmGenreCopyWith<$R, FilmGenre, FilmGenre>>
      get genres => ListCopyWith($value.genres, (v, t) => v.copyWith.$chain(t),
          (v) => call(genres: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get originCountry => ListCopyWith(
          $value.originCountry,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(originCountry: v));
  @override
  ListCopyWith<$R, ProductionCompany,
          ProductionCompanyCopyWith<$R, ProductionCompany, ProductionCompany>>
      get productionCompanies => ListCopyWith($value.productionCompanies,
          (v, t) => v.copyWith.$chain(t), (v) => call(productionCompanies: v));
  @override
  ListCopyWith<$R, ProductionCountry,
          ProductionCountryCopyWith<$R, ProductionCountry, ProductionCountry>>
      get productionCountries => ListCopyWith($value.productionCountries,
          (v, t) => v.copyWith.$chain(t), (v) => call(productionCountries: v));
  @override
  ListCopyWith<$R, SpokenLanguage,
          SpokenLanguageCopyWith<$R, SpokenLanguage, SpokenLanguage>>
      get spokenLanguages => ListCopyWith($value.spokenLanguages,
          (v, t) => v.copyWith.$chain(t), (v) => call(spokenLanguages: v));
  @override
  $R call(
          {bool? adult,
          Object? backdropPath = $none,
          Object? belongsToCollection = $none,
          int? budget,
          List<FilmGenre>? genres,
          String? homepage,
          int? id,
          String? imdbId,
          List<String>? originCountry,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          double? popularity,
          Object? posterPath = $none,
          List<ProductionCompany>? productionCompanies,
          List<ProductionCountry>? productionCountries,
          String? releaseDate,
          int? revenue,
          int? runtime,
          List<SpokenLanguage>? spokenLanguages,
          String? status,
          String? tagline,
          String? title,
          bool? video,
          double? voteAverage,
          int? voteCount}) =>
      $apply(FieldCopyWithData({
        if (adult != null) #adult: adult,
        if (backdropPath != $none) #backdropPath: backdropPath,
        if (belongsToCollection != $none)
          #belongsToCollection: belongsToCollection,
        if (budget != null) #budget: budget,
        if (genres != null) #genres: genres,
        if (homepage != null) #homepage: homepage,
        if (id != null) #id: id,
        if (imdbId != null) #imdbId: imdbId,
        if (originCountry != null) #originCountry: originCountry,
        if (originalLanguage != null) #originalLanguage: originalLanguage,
        if (originalTitle != null) #originalTitle: originalTitle,
        if (overview != null) #overview: overview,
        if (popularity != null) #popularity: popularity,
        if (posterPath != $none) #posterPath: posterPath,
        if (productionCompanies != null)
          #productionCompanies: productionCompanies,
        if (productionCountries != null)
          #productionCountries: productionCountries,
        if (releaseDate != null) #releaseDate: releaseDate,
        if (revenue != null) #revenue: revenue,
        if (runtime != null) #runtime: runtime,
        if (spokenLanguages != null) #spokenLanguages: spokenLanguages,
        if (status != null) #status: status,
        if (tagline != null) #tagline: tagline,
        if (title != null) #title: title,
        if (video != null) #video: video,
        if (voteAverage != null) #voteAverage: voteAverage,
        if (voteCount != null) #voteCount: voteCount
      }));
  @override
  FilmDetailModel $make(CopyWithData data) => FilmDetailModel(
      adult: data.get(#adult, or: $value.adult),
      backdropPath: data.get(#backdropPath, or: $value.backdropPath),
      belongsToCollection:
          data.get(#belongsToCollection, or: $value.belongsToCollection),
      budget: data.get(#budget, or: $value.budget),
      genres: data.get(#genres, or: $value.genres),
      homepage: data.get(#homepage, or: $value.homepage),
      id: data.get(#id, or: $value.id),
      imdbId: data.get(#imdbId, or: $value.imdbId),
      originCountry: data.get(#originCountry, or: $value.originCountry),
      originalLanguage:
          data.get(#originalLanguage, or: $value.originalLanguage),
      originalTitle: data.get(#originalTitle, or: $value.originalTitle),
      overview: data.get(#overview, or: $value.overview),
      popularity: data.get(#popularity, or: $value.popularity),
      posterPath: data.get(#posterPath, or: $value.posterPath),
      productionCompanies:
          data.get(#productionCompanies, or: $value.productionCompanies),
      productionCountries:
          data.get(#productionCountries, or: $value.productionCountries),
      releaseDate: data.get(#releaseDate, or: $value.releaseDate),
      revenue: data.get(#revenue, or: $value.revenue),
      runtime: data.get(#runtime, or: $value.runtime),
      spokenLanguages: data.get(#spokenLanguages, or: $value.spokenLanguages),
      status: data.get(#status, or: $value.status),
      tagline: data.get(#tagline, or: $value.tagline),
      title: data.get(#title, or: $value.title),
      video: data.get(#video, or: $value.video),
      voteAverage: data.get(#voteAverage, or: $value.voteAverage),
      voteCount: data.get(#voteCount, or: $value.voteCount));

  @override
  FilmDetailModelCopyWith<$R2, FilmDetailModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmDetailModelCopyWithImpl($value, $cast, t);
}

class FilmCollectionMapper extends ClassMapperBase<FilmCollection> {
  FilmCollectionMapper._();

  static FilmCollectionMapper? _instance;
  static FilmCollectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmCollectionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilmCollection';

  static int _$id(FilmCollection v) => v.id;
  static const Field<FilmCollection, int> _f$id = Field('id', _$id);
  static String _$name(FilmCollection v) => v.name;
  static const Field<FilmCollection, String> _f$name = Field('name', _$name);
  static String? _$posterPath(FilmCollection v) => v.posterPath;
  static const Field<FilmCollection, String> _f$posterPath =
      Field('posterPath', _$posterPath, key: r'poster_path', opt: true);
  static String? _$backdropPath(FilmCollection v) => v.backdropPath;
  static const Field<FilmCollection, String> _f$backdropPath =
      Field('backdropPath', _$backdropPath, key: r'backdrop_path', opt: true);

  @override
  final MappableFields<FilmCollection> fields = const {
    #id: _f$id,
    #name: _f$name,
    #posterPath: _f$posterPath,
    #backdropPath: _f$backdropPath,
  };

  static FilmCollection _instantiate(DecodingData data) {
    return FilmCollection(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        posterPath: data.dec(_f$posterPath),
        backdropPath: data.dec(_f$backdropPath));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmCollection fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmCollection>(map);
  }

  static FilmCollection fromJson(String json) {
    return ensureInitialized().decodeJson<FilmCollection>(json);
  }
}

mixin FilmCollectionMappable {
  String toJson() {
    return FilmCollectionMapper.ensureInitialized()
        .encodeJson<FilmCollection>(this as FilmCollection);
  }

  Map<String, dynamic> toMap() {
    return FilmCollectionMapper.ensureInitialized()
        .encodeMap<FilmCollection>(this as FilmCollection);
  }

  FilmCollectionCopyWith<FilmCollection, FilmCollection, FilmCollection>
      get copyWith => _FilmCollectionCopyWithImpl(
          this as FilmCollection, $identity, $identity);
  @override
  String toString() {
    return FilmCollectionMapper.ensureInitialized()
        .stringifyValue(this as FilmCollection);
  }

  @override
  bool operator ==(Object other) {
    return FilmCollectionMapper.ensureInitialized()
        .equalsValue(this as FilmCollection, other);
  }

  @override
  int get hashCode {
    return FilmCollectionMapper.ensureInitialized()
        .hashValue(this as FilmCollection);
  }
}

extension FilmCollectionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmCollection, $Out> {
  FilmCollectionCopyWith<$R, FilmCollection, $Out> get $asFilmCollection =>
      $base.as((v, t, t2) => _FilmCollectionCopyWithImpl(v, t, t2));
}

abstract class FilmCollectionCopyWith<$R, $In extends FilmCollection, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? posterPath, String? backdropPath});
  FilmCollectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilmCollectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmCollection, $Out>
    implements FilmCollectionCopyWith<$R, FilmCollection, $Out> {
  _FilmCollectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmCollection> $mapper =
      FilmCollectionMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          Object? posterPath = $none,
          Object? backdropPath = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (posterPath != $none) #posterPath: posterPath,
        if (backdropPath != $none) #backdropPath: backdropPath
      }));
  @override
  FilmCollection $make(CopyWithData data) => FilmCollection(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      posterPath: data.get(#posterPath, or: $value.posterPath),
      backdropPath: data.get(#backdropPath, or: $value.backdropPath));

  @override
  FilmCollectionCopyWith<$R2, FilmCollection, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmCollectionCopyWithImpl($value, $cast, t);
}

class FilmGenreMapper extends ClassMapperBase<FilmGenre> {
  FilmGenreMapper._();

  static FilmGenreMapper? _instance;
  static FilmGenreMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmGenreMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilmGenre';

  static int _$id(FilmGenre v) => v.id;
  static const Field<FilmGenre, int> _f$id = Field('id', _$id);
  static String _$name(FilmGenre v) => v.name;
  static const Field<FilmGenre, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<FilmGenre> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static FilmGenre _instantiate(DecodingData data) {
    return FilmGenre(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmGenre fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmGenre>(map);
  }

  static FilmGenre fromJson(String json) {
    return ensureInitialized().decodeJson<FilmGenre>(json);
  }
}

mixin FilmGenreMappable {
  String toJson() {
    return FilmGenreMapper.ensureInitialized()
        .encodeJson<FilmGenre>(this as FilmGenre);
  }

  Map<String, dynamic> toMap() {
    return FilmGenreMapper.ensureInitialized()
        .encodeMap<FilmGenre>(this as FilmGenre);
  }

  FilmGenreCopyWith<FilmGenre, FilmGenre, FilmGenre> get copyWith =>
      _FilmGenreCopyWithImpl(this as FilmGenre, $identity, $identity);
  @override
  String toString() {
    return FilmGenreMapper.ensureInitialized()
        .stringifyValue(this as FilmGenre);
  }

  @override
  bool operator ==(Object other) {
    return FilmGenreMapper.ensureInitialized()
        .equalsValue(this as FilmGenre, other);
  }

  @override
  int get hashCode {
    return FilmGenreMapper.ensureInitialized().hashValue(this as FilmGenre);
  }
}

extension FilmGenreValueCopy<$R, $Out> on ObjectCopyWith<$R, FilmGenre, $Out> {
  FilmGenreCopyWith<$R, FilmGenre, $Out> get $asFilmGenre =>
      $base.as((v, t, t2) => _FilmGenreCopyWithImpl(v, t, t2));
}

abstract class FilmGenreCopyWith<$R, $In extends FilmGenre, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  FilmGenreCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilmGenreCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmGenre, $Out>
    implements FilmGenreCopyWith<$R, FilmGenre, $Out> {
  _FilmGenreCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmGenre> $mapper =
      FilmGenreMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  FilmGenre $make(CopyWithData data) => FilmGenre(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  FilmGenreCopyWith<$R2, FilmGenre, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmGenreCopyWithImpl($value, $cast, t);
}

class ProductionCompanyMapper extends ClassMapperBase<ProductionCompany> {
  ProductionCompanyMapper._();

  static ProductionCompanyMapper? _instance;
  static ProductionCompanyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductionCompanyMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductionCompany';

  static int _$id(ProductionCompany v) => v.id;
  static const Field<ProductionCompany, int> _f$id = Field('id', _$id);
  static String? _$logoPath(ProductionCompany v) => v.logoPath;
  static const Field<ProductionCompany, String> _f$logoPath =
      Field('logoPath', _$logoPath, key: r'logo_path', opt: true);
  static String _$name(ProductionCompany v) => v.name;
  static const Field<ProductionCompany, String> _f$name = Field('name', _$name);
  static String _$originCountry(ProductionCompany v) => v.originCountry;
  static const Field<ProductionCompany, String> _f$originCountry =
      Field('originCountry', _$originCountry, key: r'origin_country');

  @override
  final MappableFields<ProductionCompany> fields = const {
    #id: _f$id,
    #logoPath: _f$logoPath,
    #name: _f$name,
    #originCountry: _f$originCountry,
  };

  static ProductionCompany _instantiate(DecodingData data) {
    return ProductionCompany(
        id: data.dec(_f$id),
        logoPath: data.dec(_f$logoPath),
        name: data.dec(_f$name),
        originCountry: data.dec(_f$originCountry));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductionCompany fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductionCompany>(map);
  }

  static ProductionCompany fromJson(String json) {
    return ensureInitialized().decodeJson<ProductionCompany>(json);
  }
}

mixin ProductionCompanyMappable {
  String toJson() {
    return ProductionCompanyMapper.ensureInitialized()
        .encodeJson<ProductionCompany>(this as ProductionCompany);
  }

  Map<String, dynamic> toMap() {
    return ProductionCompanyMapper.ensureInitialized()
        .encodeMap<ProductionCompany>(this as ProductionCompany);
  }

  ProductionCompanyCopyWith<ProductionCompany, ProductionCompany,
          ProductionCompany>
      get copyWith => _ProductionCompanyCopyWithImpl(
          this as ProductionCompany, $identity, $identity);
  @override
  String toString() {
    return ProductionCompanyMapper.ensureInitialized()
        .stringifyValue(this as ProductionCompany);
  }

  @override
  bool operator ==(Object other) {
    return ProductionCompanyMapper.ensureInitialized()
        .equalsValue(this as ProductionCompany, other);
  }

  @override
  int get hashCode {
    return ProductionCompanyMapper.ensureInitialized()
        .hashValue(this as ProductionCompany);
  }
}

extension ProductionCompanyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductionCompany, $Out> {
  ProductionCompanyCopyWith<$R, ProductionCompany, $Out>
      get $asProductionCompany =>
          $base.as((v, t, t2) => _ProductionCompanyCopyWithImpl(v, t, t2));
}

abstract class ProductionCompanyCopyWith<$R, $In extends ProductionCompany,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? logoPath, String? name, String? originCountry});
  ProductionCompanyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductionCompanyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductionCompany, $Out>
    implements ProductionCompanyCopyWith<$R, ProductionCompany, $Out> {
  _ProductionCompanyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductionCompany> $mapper =
      ProductionCompanyMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          Object? logoPath = $none,
          String? name,
          String? originCountry}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (logoPath != $none) #logoPath: logoPath,
        if (name != null) #name: name,
        if (originCountry != null) #originCountry: originCountry
      }));
  @override
  ProductionCompany $make(CopyWithData data) => ProductionCompany(
      id: data.get(#id, or: $value.id),
      logoPath: data.get(#logoPath, or: $value.logoPath),
      name: data.get(#name, or: $value.name),
      originCountry: data.get(#originCountry, or: $value.originCountry));

  @override
  ProductionCompanyCopyWith<$R2, ProductionCompany, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductionCompanyCopyWithImpl($value, $cast, t);
}

class ProductionCountryMapper extends ClassMapperBase<ProductionCountry> {
  ProductionCountryMapper._();

  static ProductionCountryMapper? _instance;
  static ProductionCountryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductionCountryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProductionCountry';

  static String _$iso31661(ProductionCountry v) => v.iso31661;
  static const Field<ProductionCountry, String> _f$iso31661 =
      Field('iso31661', _$iso31661, key: r'iso_3166_1');
  static String _$name(ProductionCountry v) => v.name;
  static const Field<ProductionCountry, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<ProductionCountry> fields = const {
    #iso31661: _f$iso31661,
    #name: _f$name,
  };

  static ProductionCountry _instantiate(DecodingData data) {
    return ProductionCountry(
        iso31661: data.dec(_f$iso31661), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductionCountry fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductionCountry>(map);
  }

  static ProductionCountry fromJson(String json) {
    return ensureInitialized().decodeJson<ProductionCountry>(json);
  }
}

mixin ProductionCountryMappable {
  String toJson() {
    return ProductionCountryMapper.ensureInitialized()
        .encodeJson<ProductionCountry>(this as ProductionCountry);
  }

  Map<String, dynamic> toMap() {
    return ProductionCountryMapper.ensureInitialized()
        .encodeMap<ProductionCountry>(this as ProductionCountry);
  }

  ProductionCountryCopyWith<ProductionCountry, ProductionCountry,
          ProductionCountry>
      get copyWith => _ProductionCountryCopyWithImpl(
          this as ProductionCountry, $identity, $identity);
  @override
  String toString() {
    return ProductionCountryMapper.ensureInitialized()
        .stringifyValue(this as ProductionCountry);
  }

  @override
  bool operator ==(Object other) {
    return ProductionCountryMapper.ensureInitialized()
        .equalsValue(this as ProductionCountry, other);
  }

  @override
  int get hashCode {
    return ProductionCountryMapper.ensureInitialized()
        .hashValue(this as ProductionCountry);
  }
}

extension ProductionCountryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductionCountry, $Out> {
  ProductionCountryCopyWith<$R, ProductionCountry, $Out>
      get $asProductionCountry =>
          $base.as((v, t, t2) => _ProductionCountryCopyWithImpl(v, t, t2));
}

abstract class ProductionCountryCopyWith<$R, $In extends ProductionCountry,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? iso31661, String? name});
  ProductionCountryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProductionCountryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductionCountry, $Out>
    implements ProductionCountryCopyWith<$R, ProductionCountry, $Out> {
  _ProductionCountryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductionCountry> $mapper =
      ProductionCountryMapper.ensureInitialized();
  @override
  $R call({String? iso31661, String? name}) => $apply(FieldCopyWithData({
        if (iso31661 != null) #iso31661: iso31661,
        if (name != null) #name: name
      }));
  @override
  ProductionCountry $make(CopyWithData data) => ProductionCountry(
      iso31661: data.get(#iso31661, or: $value.iso31661),
      name: data.get(#name, or: $value.name));

  @override
  ProductionCountryCopyWith<$R2, ProductionCountry, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProductionCountryCopyWithImpl($value, $cast, t);
}

class SpokenLanguageMapper extends ClassMapperBase<SpokenLanguage> {
  SpokenLanguageMapper._();

  static SpokenLanguageMapper? _instance;
  static SpokenLanguageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpokenLanguageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SpokenLanguage';

  static String _$englishName(SpokenLanguage v) => v.englishName;
  static const Field<SpokenLanguage, String> _f$englishName =
      Field('englishName', _$englishName, key: r'english_name');
  static String _$iso6391(SpokenLanguage v) => v.iso6391;
  static const Field<SpokenLanguage, String> _f$iso6391 =
      Field('iso6391', _$iso6391, key: r'iso_639_1');
  static String _$name(SpokenLanguage v) => v.name;
  static const Field<SpokenLanguage, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<SpokenLanguage> fields = const {
    #englishName: _f$englishName,
    #iso6391: _f$iso6391,
    #name: _f$name,
  };

  static SpokenLanguage _instantiate(DecodingData data) {
    return SpokenLanguage(
        englishName: data.dec(_f$englishName),
        iso6391: data.dec(_f$iso6391),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SpokenLanguage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SpokenLanguage>(map);
  }

  static SpokenLanguage fromJson(String json) {
    return ensureInitialized().decodeJson<SpokenLanguage>(json);
  }
}

mixin SpokenLanguageMappable {
  String toJson() {
    return SpokenLanguageMapper.ensureInitialized()
        .encodeJson<SpokenLanguage>(this as SpokenLanguage);
  }

  Map<String, dynamic> toMap() {
    return SpokenLanguageMapper.ensureInitialized()
        .encodeMap<SpokenLanguage>(this as SpokenLanguage);
  }

  SpokenLanguageCopyWith<SpokenLanguage, SpokenLanguage, SpokenLanguage>
      get copyWith => _SpokenLanguageCopyWithImpl(
          this as SpokenLanguage, $identity, $identity);
  @override
  String toString() {
    return SpokenLanguageMapper.ensureInitialized()
        .stringifyValue(this as SpokenLanguage);
  }

  @override
  bool operator ==(Object other) {
    return SpokenLanguageMapper.ensureInitialized()
        .equalsValue(this as SpokenLanguage, other);
  }

  @override
  int get hashCode {
    return SpokenLanguageMapper.ensureInitialized()
        .hashValue(this as SpokenLanguage);
  }
}

extension SpokenLanguageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SpokenLanguage, $Out> {
  SpokenLanguageCopyWith<$R, SpokenLanguage, $Out> get $asSpokenLanguage =>
      $base.as((v, t, t2) => _SpokenLanguageCopyWithImpl(v, t, t2));
}

abstract class SpokenLanguageCopyWith<$R, $In extends SpokenLanguage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? englishName, String? iso6391, String? name});
  SpokenLanguageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SpokenLanguageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SpokenLanguage, $Out>
    implements SpokenLanguageCopyWith<$R, SpokenLanguage, $Out> {
  _SpokenLanguageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SpokenLanguage> $mapper =
      SpokenLanguageMapper.ensureInitialized();
  @override
  $R call({String? englishName, String? iso6391, String? name}) =>
      $apply(FieldCopyWithData({
        if (englishName != null) #englishName: englishName,
        if (iso6391 != null) #iso6391: iso6391,
        if (name != null) #name: name
      }));
  @override
  SpokenLanguage $make(CopyWithData data) => SpokenLanguage(
      englishName: data.get(#englishName, or: $value.englishName),
      iso6391: data.get(#iso6391, or: $value.iso6391),
      name: data.get(#name, or: $value.name));

  @override
  SpokenLanguageCopyWith<$R2, SpokenLanguage, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SpokenLanguageCopyWithImpl($value, $cast, t);
}
