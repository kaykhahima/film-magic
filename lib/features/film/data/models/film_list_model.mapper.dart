// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'film_list_model.dart';

class FilmListModelMapper extends ClassMapperBase<FilmListModel> {
  FilmListModelMapper._();

  static FilmListModelMapper? _instance;
  static FilmListModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmListModelMapper._());
      DateTimeRangeMapper.ensureInitialized();
      FilmModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilmListModel';

  static DateTimeRange? _$dates(FilmListModel v) => v.dates;
  static const Field<FilmListModel, DateTimeRange> _f$dates =
      Field('dates', _$dates, opt: true);
  static List<FilmModel> _$results(FilmListModel v) => v.results;
  static const Field<FilmListModel, List<FilmModel>> _f$results =
      Field('results', _$results);
  static int _$page(FilmListModel v) => v.page;
  static const Field<FilmListModel, int> _f$page = Field('page', _$page);
  static int _$totalPages(FilmListModel v) => v.totalPages;
  static const Field<FilmListModel, int> _f$totalPages =
      Field('totalPages', _$totalPages);
  static int _$totalResults(FilmListModel v) => v.totalResults;
  static const Field<FilmListModel, int> _f$totalResults =
      Field('totalResults', _$totalResults);

  @override
  final MappableFields<FilmListModel> fields = const {
    #dates: _f$dates,
    #results: _f$results,
    #page: _f$page,
    #totalPages: _f$totalPages,
    #totalResults: _f$totalResults,
  };

  static FilmListModel _instantiate(DecodingData data) {
    return FilmListModel(
        dates: data.dec(_f$dates),
        results: data.dec(_f$results),
        page: data.dec(_f$page),
        totalPages: data.dec(_f$totalPages),
        totalResults: data.dec(_f$totalResults));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmListModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmListModel>(map);
  }

  static FilmListModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmListModel>(json);
  }
}

mixin FilmListModelMappable {
  String toJson() {
    return FilmListModelMapper.ensureInitialized()
        .encodeJson<FilmListModel>(this as FilmListModel);
  }

  Map<String, dynamic> toMap() {
    return FilmListModelMapper.ensureInitialized()
        .encodeMap<FilmListModel>(this as FilmListModel);
  }

  FilmListModelCopyWith<FilmListModel, FilmListModel, FilmListModel>
      get copyWith => _FilmListModelCopyWithImpl(
          this as FilmListModel, $identity, $identity);
  @override
  String toString() {
    return FilmListModelMapper.ensureInitialized()
        .stringifyValue(this as FilmListModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmListModelMapper.ensureInitialized()
        .equalsValue(this as FilmListModel, other);
  }

  @override
  int get hashCode {
    return FilmListModelMapper.ensureInitialized()
        .hashValue(this as FilmListModel);
  }
}

extension FilmListModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmListModel, $Out> {
  FilmListModelCopyWith<$R, FilmListModel, $Out> get $asFilmListModel =>
      $base.as((v, t, t2) => _FilmListModelCopyWithImpl(v, t, t2));
}

abstract class FilmListModelCopyWith<$R, $In extends FilmListModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  DateTimeRangeCopyWith<$R, DateTimeRange, DateTimeRange>? get dates;
  ListCopyWith<$R, FilmModel, FilmModelCopyWith<$R, FilmModel, FilmModel>>
      get results;
  $R call(
      {DateTimeRange? dates,
      List<FilmModel>? results,
      int? page,
      int? totalPages,
      int? totalResults});
  FilmListModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilmListModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmListModel, $Out>
    implements FilmListModelCopyWith<$R, FilmListModel, $Out> {
  _FilmListModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmListModel> $mapper =
      FilmListModelMapper.ensureInitialized();
  @override
  DateTimeRangeCopyWith<$R, DateTimeRange, DateTimeRange>? get dates =>
      $value.dates?.copyWith.$chain((v) => call(dates: v));
  @override
  ListCopyWith<$R, FilmModel, FilmModelCopyWith<$R, FilmModel, FilmModel>>
      get results => ListCopyWith($value.results,
          (v, t) => v.copyWith.$chain(t), (v) => call(results: v));
  @override
  $R call(
          {Object? dates = $none,
          List<FilmModel>? results,
          int? page,
          int? totalPages,
          int? totalResults}) =>
      $apply(FieldCopyWithData({
        if (dates != $none) #dates: dates,
        if (results != null) #results: results,
        if (page != null) #page: page,
        if (totalPages != null) #totalPages: totalPages,
        if (totalResults != null) #totalResults: totalResults
      }));
  @override
  FilmListModel $make(CopyWithData data) => FilmListModel(
      dates: data.get(#dates, or: $value.dates),
      results: data.get(#results, or: $value.results),
      page: data.get(#page, or: $value.page),
      totalPages: data.get(#totalPages, or: $value.totalPages),
      totalResults: data.get(#totalResults, or: $value.totalResults));

  @override
  FilmListModelCopyWith<$R2, FilmListModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmListModelCopyWithImpl($value, $cast, t);
}

class DateTimeRangeMapper extends ClassMapperBase<DateTimeRange> {
  DateTimeRangeMapper._();

  static DateTimeRangeMapper? _instance;
  static DateTimeRangeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DateTimeRangeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'DateTimeRange';

  static String _$maximum(DateTimeRange v) => v.maximum;
  static const Field<DateTimeRange, String> _f$maximum =
      Field('maximum', _$maximum);
  static String _$minimum(DateTimeRange v) => v.minimum;
  static const Field<DateTimeRange, String> _f$minimum =
      Field('minimum', _$minimum);

  @override
  final MappableFields<DateTimeRange> fields = const {
    #maximum: _f$maximum,
    #minimum: _f$minimum,
  };

  static DateTimeRange _instantiate(DecodingData data) {
    return DateTimeRange(
        maximum: data.dec(_f$maximum), minimum: data.dec(_f$minimum));
  }

  @override
  final Function instantiate = _instantiate;

  static DateTimeRange fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DateTimeRange>(map);
  }

  static DateTimeRange fromJson(String json) {
    return ensureInitialized().decodeJson<DateTimeRange>(json);
  }
}

mixin DateTimeRangeMappable {
  String toJson() {
    return DateTimeRangeMapper.ensureInitialized()
        .encodeJson<DateTimeRange>(this as DateTimeRange);
  }

  Map<String, dynamic> toMap() {
    return DateTimeRangeMapper.ensureInitialized()
        .encodeMap<DateTimeRange>(this as DateTimeRange);
  }

  DateTimeRangeCopyWith<DateTimeRange, DateTimeRange, DateTimeRange>
      get copyWith => _DateTimeRangeCopyWithImpl(
          this as DateTimeRange, $identity, $identity);
  @override
  String toString() {
    return DateTimeRangeMapper.ensureInitialized()
        .stringifyValue(this as DateTimeRange);
  }

  @override
  bool operator ==(Object other) {
    return DateTimeRangeMapper.ensureInitialized()
        .equalsValue(this as DateTimeRange, other);
  }

  @override
  int get hashCode {
    return DateTimeRangeMapper.ensureInitialized()
        .hashValue(this as DateTimeRange);
  }
}

extension DateTimeRangeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DateTimeRange, $Out> {
  DateTimeRangeCopyWith<$R, DateTimeRange, $Out> get $asDateTimeRange =>
      $base.as((v, t, t2) => _DateTimeRangeCopyWithImpl(v, t, t2));
}

abstract class DateTimeRangeCopyWith<$R, $In extends DateTimeRange, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? maximum, String? minimum});
  DateTimeRangeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DateTimeRangeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DateTimeRange, $Out>
    implements DateTimeRangeCopyWith<$R, DateTimeRange, $Out> {
  _DateTimeRangeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DateTimeRange> $mapper =
      DateTimeRangeMapper.ensureInitialized();
  @override
  $R call({String? maximum, String? minimum}) => $apply(FieldCopyWithData({
        if (maximum != null) #maximum: maximum,
        if (minimum != null) #minimum: minimum
      }));
  @override
  DateTimeRange $make(CopyWithData data) => DateTimeRange(
      maximum: data.get(#maximum, or: $value.maximum),
      minimum: data.get(#minimum, or: $value.minimum));

  @override
  DateTimeRangeCopyWith<$R2, DateTimeRange, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DateTimeRangeCopyWithImpl($value, $cast, t);
}

class FilmModelMapper extends ClassMapperBase<FilmModel> {
  FilmModelMapper._();

  static FilmModelMapper? _instance;
  static FilmModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilmModel';

  static bool _$adult(FilmModel v) => v.adult;
  static const Field<FilmModel, bool> _f$adult = Field('adult', _$adult);
  static String _$backdropPath(FilmModel v) => v.backdropPath;
  static const Field<FilmModel, String> _f$backdropPath =
      Field('backdropPath', _$backdropPath);
  static List<int> _$genreIds(FilmModel v) => v.genreIds;
  static const Field<FilmModel, List<int>> _f$genreIds =
      Field('genreIds', _$genreIds);
  static int _$id(FilmModel v) => v.id;
  static const Field<FilmModel, int> _f$id = Field('id', _$id);
  static String _$originalLanguage(FilmModel v) => v.originalLanguage;
  static const Field<FilmModel, String> _f$originalLanguage =
      Field('originalLanguage', _$originalLanguage);
  static String _$originalTitle(FilmModel v) => v.originalTitle;
  static const Field<FilmModel, String> _f$originalTitle =
      Field('originalTitle', _$originalTitle);
  static String _$overview(FilmModel v) => v.overview;
  static const Field<FilmModel, String> _f$overview =
      Field('overview', _$overview);
  static double _$popularity(FilmModel v) => v.popularity;
  static const Field<FilmModel, double> _f$popularity =
      Field('popularity', _$popularity);
  static String _$posterPath(FilmModel v) => v.posterPath;
  static const Field<FilmModel, String> _f$posterPath =
      Field('posterPath', _$posterPath);
  static String _$releaseDate(FilmModel v) => v.releaseDate;
  static const Field<FilmModel, String> _f$releaseDate =
      Field('releaseDate', _$releaseDate);
  static String _$title(FilmModel v) => v.title;
  static const Field<FilmModel, String> _f$title = Field('title', _$title);
  static bool _$video(FilmModel v) => v.video;
  static const Field<FilmModel, bool> _f$video = Field('video', _$video);
  static double _$voteAverage(FilmModel v) => v.voteAverage;
  static const Field<FilmModel, double> _f$voteAverage =
      Field('voteAverage', _$voteAverage);
  static int _$voteCount(FilmModel v) => v.voteCount;
  static const Field<FilmModel, int> _f$voteCount =
      Field('voteCount', _$voteCount);

  @override
  final MappableFields<FilmModel> fields = const {
    #adult: _f$adult,
    #backdropPath: _f$backdropPath,
    #genreIds: _f$genreIds,
    #id: _f$id,
    #originalLanguage: _f$originalLanguage,
    #originalTitle: _f$originalTitle,
    #overview: _f$overview,
    #popularity: _f$popularity,
    #posterPath: _f$posterPath,
    #releaseDate: _f$releaseDate,
    #title: _f$title,
    #video: _f$video,
    #voteAverage: _f$voteAverage,
    #voteCount: _f$voteCount,
  };

  static FilmModel _instantiate(DecodingData data) {
    return FilmModel(
        adult: data.dec(_f$adult),
        backdropPath: data.dec(_f$backdropPath),
        genreIds: data.dec(_f$genreIds),
        id: data.dec(_f$id),
        originalLanguage: data.dec(_f$originalLanguage),
        originalTitle: data.dec(_f$originalTitle),
        overview: data.dec(_f$overview),
        popularity: data.dec(_f$popularity),
        posterPath: data.dec(_f$posterPath),
        releaseDate: data.dec(_f$releaseDate),
        title: data.dec(_f$title),
        video: data.dec(_f$video),
        voteAverage: data.dec(_f$voteAverage),
        voteCount: data.dec(_f$voteCount));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmModel>(map);
  }

  static FilmModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmModel>(json);
  }
}

mixin FilmModelMappable {
  String toJson() {
    return FilmModelMapper.ensureInitialized()
        .encodeJson<FilmModel>(this as FilmModel);
  }

  Map<String, dynamic> toMap() {
    return FilmModelMapper.ensureInitialized()
        .encodeMap<FilmModel>(this as FilmModel);
  }

  FilmModelCopyWith<FilmModel, FilmModel, FilmModel> get copyWith =>
      _FilmModelCopyWithImpl(this as FilmModel, $identity, $identity);
  @override
  String toString() {
    return FilmModelMapper.ensureInitialized()
        .stringifyValue(this as FilmModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmModelMapper.ensureInitialized()
        .equalsValue(this as FilmModel, other);
  }

  @override
  int get hashCode {
    return FilmModelMapper.ensureInitialized().hashValue(this as FilmModel);
  }
}

extension FilmModelValueCopy<$R, $Out> on ObjectCopyWith<$R, FilmModel, $Out> {
  FilmModelCopyWith<$R, FilmModel, $Out> get $asFilmModel =>
      $base.as((v, t, t2) => _FilmModelCopyWithImpl(v, t, t2));
}

abstract class FilmModelCopyWith<$R, $In extends FilmModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get genreIds;
  $R call(
      {bool? adult,
      String? backdropPath,
      List<int>? genreIds,
      int? id,
      String? originalLanguage,
      String? originalTitle,
      String? overview,
      double? popularity,
      String? posterPath,
      String? releaseDate,
      String? title,
      bool? video,
      double? voteAverage,
      int? voteCount});
  FilmModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilmModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmModel, $Out>
    implements FilmModelCopyWith<$R, FilmModel, $Out> {
  _FilmModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmModel> $mapper =
      FilmModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get genreIds =>
      ListCopyWith($value.genreIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(genreIds: v));
  @override
  $R call(
          {bool? adult,
          String? backdropPath,
          List<int>? genreIds,
          int? id,
          String? originalLanguage,
          String? originalTitle,
          String? overview,
          double? popularity,
          String? posterPath,
          String? releaseDate,
          String? title,
          bool? video,
          double? voteAverage,
          int? voteCount}) =>
      $apply(FieldCopyWithData({
        if (adult != null) #adult: adult,
        if (backdropPath != null) #backdropPath: backdropPath,
        if (genreIds != null) #genreIds: genreIds,
        if (id != null) #id: id,
        if (originalLanguage != null) #originalLanguage: originalLanguage,
        if (originalTitle != null) #originalTitle: originalTitle,
        if (overview != null) #overview: overview,
        if (popularity != null) #popularity: popularity,
        if (posterPath != null) #posterPath: posterPath,
        if (releaseDate != null) #releaseDate: releaseDate,
        if (title != null) #title: title,
        if (video != null) #video: video,
        if (voteAverage != null) #voteAverage: voteAverage,
        if (voteCount != null) #voteCount: voteCount
      }));
  @override
  FilmModel $make(CopyWithData data) => FilmModel(
      adult: data.get(#adult, or: $value.adult),
      backdropPath: data.get(#backdropPath, or: $value.backdropPath),
      genreIds: data.get(#genreIds, or: $value.genreIds),
      id: data.get(#id, or: $value.id),
      originalLanguage:
          data.get(#originalLanguage, or: $value.originalLanguage),
      originalTitle: data.get(#originalTitle, or: $value.originalTitle),
      overview: data.get(#overview, or: $value.overview),
      popularity: data.get(#popularity, or: $value.popularity),
      posterPath: data.get(#posterPath, or: $value.posterPath),
      releaseDate: data.get(#releaseDate, or: $value.releaseDate),
      title: data.get(#title, or: $value.title),
      video: data.get(#video, or: $value.video),
      voteAverage: data.get(#voteAverage, or: $value.voteAverage),
      voteCount: data.get(#voteCount, or: $value.voteCount));

  @override
  FilmModelCopyWith<$R2, FilmModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmModelCopyWithImpl($value, $cast, t);
}
