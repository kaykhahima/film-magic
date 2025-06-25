// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'film_credits_model.dart';

class FilmCreditsModelMapper extends ClassMapperBase<FilmCreditsModel> {
  FilmCreditsModelMapper._();

  static FilmCreditsModelMapper? _instance;
  static FilmCreditsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmCreditsModelMapper._());
      FilmCastModelMapper.ensureInitialized();
      FilmCrewModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilmCreditsModel';

  static String _$id(FilmCreditsModel v) => v.id;
  static const Field<FilmCreditsModel, String> _f$id = Field('id', _$id);
  static List<FilmCastModel> _$cast(FilmCreditsModel v) => v.cast;
  static const Field<FilmCreditsModel, List<FilmCastModel>> _f$cast =
      Field('cast', _$cast);
  static List<FilmCrewModel> _$crew(FilmCreditsModel v) => v.crew;
  static const Field<FilmCreditsModel, List<FilmCrewModel>> _f$crew =
      Field('crew', _$crew);

  @override
  final MappableFields<FilmCreditsModel> fields = const {
    #id: _f$id,
    #cast: _f$cast,
    #crew: _f$crew,
  };

  static FilmCreditsModel _instantiate(DecodingData data) {
    return FilmCreditsModel(
        id: data.dec(_f$id), cast: data.dec(_f$cast), crew: data.dec(_f$crew));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmCreditsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmCreditsModel>(map);
  }

  static FilmCreditsModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmCreditsModel>(json);
  }
}

mixin FilmCreditsModelMappable {
  String toJson() {
    return FilmCreditsModelMapper.ensureInitialized()
        .encodeJson<FilmCreditsModel>(this as FilmCreditsModel);
  }

  Map<String, dynamic> toMap() {
    return FilmCreditsModelMapper.ensureInitialized()
        .encodeMap<FilmCreditsModel>(this as FilmCreditsModel);
  }

  FilmCreditsModelCopyWith<FilmCreditsModel, FilmCreditsModel, FilmCreditsModel>
      get copyWith => _FilmCreditsModelCopyWithImpl(
          this as FilmCreditsModel, $identity, $identity);
  @override
  String toString() {
    return FilmCreditsModelMapper.ensureInitialized()
        .stringifyValue(this as FilmCreditsModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmCreditsModelMapper.ensureInitialized()
        .equalsValue(this as FilmCreditsModel, other);
  }

  @override
  int get hashCode {
    return FilmCreditsModelMapper.ensureInitialized()
        .hashValue(this as FilmCreditsModel);
  }
}

extension FilmCreditsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmCreditsModel, $Out> {
  FilmCreditsModelCopyWith<$R, FilmCreditsModel, $Out>
      get $asFilmCreditsModel =>
          $base.as((v, t, t2) => _FilmCreditsModelCopyWithImpl(v, t, t2));
}

abstract class FilmCreditsModelCopyWith<$R, $In extends FilmCreditsModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, FilmCastModel,
      FilmCastModelCopyWith<$R, FilmCastModel, FilmCastModel>> get cast;
  ListCopyWith<$R, FilmCrewModel,
      FilmCrewModelCopyWith<$R, FilmCrewModel, FilmCrewModel>> get crew;
  $R call({String? id, List<FilmCastModel>? cast, List<FilmCrewModel>? crew});
  FilmCreditsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilmCreditsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmCreditsModel, $Out>
    implements FilmCreditsModelCopyWith<$R, FilmCreditsModel, $Out> {
  _FilmCreditsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmCreditsModel> $mapper =
      FilmCreditsModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, FilmCastModel,
          FilmCastModelCopyWith<$R, FilmCastModel, FilmCastModel>>
      get cast => ListCopyWith(
          $value.cast, (v, t) => v.copyWith.$chain(t), (v) => call(cast: v));
  @override
  ListCopyWith<$R, FilmCrewModel,
          FilmCrewModelCopyWith<$R, FilmCrewModel, FilmCrewModel>>
      get crew => ListCopyWith(
          $value.crew, (v, t) => v.copyWith.$chain(t), (v) => call(crew: v));
  @override
  $R call({String? id, List<FilmCastModel>? cast, List<FilmCrewModel>? crew}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (cast != null) #cast: cast,
        if (crew != null) #crew: crew
      }));
  @override
  FilmCreditsModel $make(CopyWithData data) => FilmCreditsModel(
      id: data.get(#id, or: $value.id),
      cast: data.get(#cast, or: $value.cast),
      crew: data.get(#crew, or: $value.crew));

  @override
  FilmCreditsModelCopyWith<$R2, FilmCreditsModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmCreditsModelCopyWithImpl($value, $cast, t);
}

class FilmCastModelMapper extends ClassMapperBase<FilmCastModel> {
  FilmCastModelMapper._();

  static FilmCastModelMapper? _instance;
  static FilmCastModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmCastModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilmCastModel';

  static bool _$adult(FilmCastModel v) => v.adult;
  static const Field<FilmCastModel, bool> _f$adult = Field('adult', _$adult);
  static int _$gender(FilmCastModel v) => v.gender;
  static const Field<FilmCastModel, int> _f$gender = Field('gender', _$gender);
  static int _$id(FilmCastModel v) => v.id;
  static const Field<FilmCastModel, int> _f$id = Field('id', _$id);
  static String _$knownForDepartment(FilmCastModel v) => v.knownForDepartment;
  static const Field<FilmCastModel, String> _f$knownForDepartment =
      Field('knownForDepartment', _$knownForDepartment);
  static String _$name(FilmCastModel v) => v.name;
  static const Field<FilmCastModel, String> _f$name = Field('name', _$name);
  static String _$originalName(FilmCastModel v) => v.originalName;
  static const Field<FilmCastModel, String> _f$originalName =
      Field('originalName', _$originalName);
  static double _$popularity(FilmCastModel v) => v.popularity;
  static const Field<FilmCastModel, double> _f$popularity =
      Field('popularity', _$popularity);
  static String _$profilePath(FilmCastModel v) => v.profilePath;
  static const Field<FilmCastModel, String> _f$profilePath =
      Field('profilePath', _$profilePath);
  static int _$castId(FilmCastModel v) => v.castId;
  static const Field<FilmCastModel, int> _f$castId = Field('castId', _$castId);
  static String _$character(FilmCastModel v) => v.character;
  static const Field<FilmCastModel, String> _f$character =
      Field('character', _$character);
  static String _$creditId(FilmCastModel v) => v.creditId;
  static const Field<FilmCastModel, String> _f$creditId =
      Field('creditId', _$creditId);
  static int _$order(FilmCastModel v) => v.order;
  static const Field<FilmCastModel, int> _f$order = Field('order', _$order);

  @override
  final MappableFields<FilmCastModel> fields = const {
    #adult: _f$adult,
    #gender: _f$gender,
    #id: _f$id,
    #knownForDepartment: _f$knownForDepartment,
    #name: _f$name,
    #originalName: _f$originalName,
    #popularity: _f$popularity,
    #profilePath: _f$profilePath,
    #castId: _f$castId,
    #character: _f$character,
    #creditId: _f$creditId,
    #order: _f$order,
  };

  static FilmCastModel _instantiate(DecodingData data) {
    return FilmCastModel(
        adult: data.dec(_f$adult),
        gender: data.dec(_f$gender),
        id: data.dec(_f$id),
        knownForDepartment: data.dec(_f$knownForDepartment),
        name: data.dec(_f$name),
        originalName: data.dec(_f$originalName),
        popularity: data.dec(_f$popularity),
        profilePath: data.dec(_f$profilePath),
        castId: data.dec(_f$castId),
        character: data.dec(_f$character),
        creditId: data.dec(_f$creditId),
        order: data.dec(_f$order));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmCastModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmCastModel>(map);
  }

  static FilmCastModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmCastModel>(json);
  }
}

mixin FilmCastModelMappable {
  String toJson() {
    return FilmCastModelMapper.ensureInitialized()
        .encodeJson<FilmCastModel>(this as FilmCastModel);
  }

  Map<String, dynamic> toMap() {
    return FilmCastModelMapper.ensureInitialized()
        .encodeMap<FilmCastModel>(this as FilmCastModel);
  }

  FilmCastModelCopyWith<FilmCastModel, FilmCastModel, FilmCastModel>
      get copyWith => _FilmCastModelCopyWithImpl(
          this as FilmCastModel, $identity, $identity);
  @override
  String toString() {
    return FilmCastModelMapper.ensureInitialized()
        .stringifyValue(this as FilmCastModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmCastModelMapper.ensureInitialized()
        .equalsValue(this as FilmCastModel, other);
  }

  @override
  int get hashCode {
    return FilmCastModelMapper.ensureInitialized()
        .hashValue(this as FilmCastModel);
  }
}

extension FilmCastModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmCastModel, $Out> {
  FilmCastModelCopyWith<$R, FilmCastModel, $Out> get $asFilmCastModel =>
      $base.as((v, t, t2) => _FilmCastModelCopyWithImpl(v, t, t2));
}

abstract class FilmCastModelCopyWith<$R, $In extends FilmCastModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? adult,
      int? gender,
      int? id,
      String? knownForDepartment,
      String? name,
      String? originalName,
      double? popularity,
      String? profilePath,
      int? castId,
      String? character,
      String? creditId,
      int? order});
  FilmCastModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilmCastModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmCastModel, $Out>
    implements FilmCastModelCopyWith<$R, FilmCastModel, $Out> {
  _FilmCastModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmCastModel> $mapper =
      FilmCastModelMapper.ensureInitialized();
  @override
  $R call(
          {bool? adult,
          int? gender,
          int? id,
          String? knownForDepartment,
          String? name,
          String? originalName,
          double? popularity,
          String? profilePath,
          int? castId,
          String? character,
          String? creditId,
          int? order}) =>
      $apply(FieldCopyWithData({
        if (adult != null) #adult: adult,
        if (gender != null) #gender: gender,
        if (id != null) #id: id,
        if (knownForDepartment != null) #knownForDepartment: knownForDepartment,
        if (name != null) #name: name,
        if (originalName != null) #originalName: originalName,
        if (popularity != null) #popularity: popularity,
        if (profilePath != null) #profilePath: profilePath,
        if (castId != null) #castId: castId,
        if (character != null) #character: character,
        if (creditId != null) #creditId: creditId,
        if (order != null) #order: order
      }));
  @override
  FilmCastModel $make(CopyWithData data) => FilmCastModel(
      adult: data.get(#adult, or: $value.adult),
      gender: data.get(#gender, or: $value.gender),
      id: data.get(#id, or: $value.id),
      knownForDepartment:
          data.get(#knownForDepartment, or: $value.knownForDepartment),
      name: data.get(#name, or: $value.name),
      originalName: data.get(#originalName, or: $value.originalName),
      popularity: data.get(#popularity, or: $value.popularity),
      profilePath: data.get(#profilePath, or: $value.profilePath),
      castId: data.get(#castId, or: $value.castId),
      character: data.get(#character, or: $value.character),
      creditId: data.get(#creditId, or: $value.creditId),
      order: data.get(#order, or: $value.order));

  @override
  FilmCastModelCopyWith<$R2, FilmCastModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmCastModelCopyWithImpl($value, $cast, t);
}

class FilmCrewModelMapper extends ClassMapperBase<FilmCrewModel> {
  FilmCrewModelMapper._();

  static FilmCrewModelMapper? _instance;
  static FilmCrewModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilmCrewModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FilmCrewModel';

  static bool _$adult(FilmCrewModel v) => v.adult;
  static const Field<FilmCrewModel, bool> _f$adult = Field('adult', _$adult);
  static int _$gender(FilmCrewModel v) => v.gender;
  static const Field<FilmCrewModel, int> _f$gender = Field('gender', _$gender);
  static int _$id(FilmCrewModel v) => v.id;
  static const Field<FilmCrewModel, int> _f$id = Field('id', _$id);
  static String _$knownForDepartment(FilmCrewModel v) => v.knownForDepartment;
  static const Field<FilmCrewModel, String> _f$knownForDepartment =
      Field('knownForDepartment', _$knownForDepartment);
  static String _$name(FilmCrewModel v) => v.name;
  static const Field<FilmCrewModel, String> _f$name = Field('name', _$name);
  static String _$originalName(FilmCrewModel v) => v.originalName;
  static const Field<FilmCrewModel, String> _f$originalName =
      Field('originalName', _$originalName);
  static double _$popularity(FilmCrewModel v) => v.popularity;
  static const Field<FilmCrewModel, double> _f$popularity =
      Field('popularity', _$popularity);
  static String _$profilePath(FilmCrewModel v) => v.profilePath;
  static const Field<FilmCrewModel, String> _f$profilePath =
      Field('profilePath', _$profilePath);
  static String _$creditId(FilmCrewModel v) => v.creditId;
  static const Field<FilmCrewModel, String> _f$creditId =
      Field('creditId', _$creditId);
  static String _$department(FilmCrewModel v) => v.department;
  static const Field<FilmCrewModel, String> _f$department =
      Field('department', _$department);
  static String _$job(FilmCrewModel v) => v.job;
  static const Field<FilmCrewModel, String> _f$job = Field('job', _$job);

  @override
  final MappableFields<FilmCrewModel> fields = const {
    #adult: _f$adult,
    #gender: _f$gender,
    #id: _f$id,
    #knownForDepartment: _f$knownForDepartment,
    #name: _f$name,
    #originalName: _f$originalName,
    #popularity: _f$popularity,
    #profilePath: _f$profilePath,
    #creditId: _f$creditId,
    #department: _f$department,
    #job: _f$job,
  };

  static FilmCrewModel _instantiate(DecodingData data) {
    return FilmCrewModel(
        adult: data.dec(_f$adult),
        gender: data.dec(_f$gender),
        id: data.dec(_f$id),
        knownForDepartment: data.dec(_f$knownForDepartment),
        name: data.dec(_f$name),
        originalName: data.dec(_f$originalName),
        popularity: data.dec(_f$popularity),
        profilePath: data.dec(_f$profilePath),
        creditId: data.dec(_f$creditId),
        department: data.dec(_f$department),
        job: data.dec(_f$job));
  }

  @override
  final Function instantiate = _instantiate;

  static FilmCrewModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilmCrewModel>(map);
  }

  static FilmCrewModel fromJson(String json) {
    return ensureInitialized().decodeJson<FilmCrewModel>(json);
  }
}

mixin FilmCrewModelMappable {
  String toJson() {
    return FilmCrewModelMapper.ensureInitialized()
        .encodeJson<FilmCrewModel>(this as FilmCrewModel);
  }

  Map<String, dynamic> toMap() {
    return FilmCrewModelMapper.ensureInitialized()
        .encodeMap<FilmCrewModel>(this as FilmCrewModel);
  }

  FilmCrewModelCopyWith<FilmCrewModel, FilmCrewModel, FilmCrewModel>
      get copyWith => _FilmCrewModelCopyWithImpl(
          this as FilmCrewModel, $identity, $identity);
  @override
  String toString() {
    return FilmCrewModelMapper.ensureInitialized()
        .stringifyValue(this as FilmCrewModel);
  }

  @override
  bool operator ==(Object other) {
    return FilmCrewModelMapper.ensureInitialized()
        .equalsValue(this as FilmCrewModel, other);
  }

  @override
  int get hashCode {
    return FilmCrewModelMapper.ensureInitialized()
        .hashValue(this as FilmCrewModel);
  }
}

extension FilmCrewModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilmCrewModel, $Out> {
  FilmCrewModelCopyWith<$R, FilmCrewModel, $Out> get $asFilmCrewModel =>
      $base.as((v, t, t2) => _FilmCrewModelCopyWithImpl(v, t, t2));
}

abstract class FilmCrewModelCopyWith<$R, $In extends FilmCrewModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? adult,
      int? gender,
      int? id,
      String? knownForDepartment,
      String? name,
      String? originalName,
      double? popularity,
      String? profilePath,
      String? creditId,
      String? department,
      String? job});
  FilmCrewModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FilmCrewModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilmCrewModel, $Out>
    implements FilmCrewModelCopyWith<$R, FilmCrewModel, $Out> {
  _FilmCrewModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilmCrewModel> $mapper =
      FilmCrewModelMapper.ensureInitialized();
  @override
  $R call(
          {bool? adult,
          int? gender,
          int? id,
          String? knownForDepartment,
          String? name,
          String? originalName,
          double? popularity,
          String? profilePath,
          String? creditId,
          String? department,
          String? job}) =>
      $apply(FieldCopyWithData({
        if (adult != null) #adult: adult,
        if (gender != null) #gender: gender,
        if (id != null) #id: id,
        if (knownForDepartment != null) #knownForDepartment: knownForDepartment,
        if (name != null) #name: name,
        if (originalName != null) #originalName: originalName,
        if (popularity != null) #popularity: popularity,
        if (profilePath != null) #profilePath: profilePath,
        if (creditId != null) #creditId: creditId,
        if (department != null) #department: department,
        if (job != null) #job: job
      }));
  @override
  FilmCrewModel $make(CopyWithData data) => FilmCrewModel(
      adult: data.get(#adult, or: $value.adult),
      gender: data.get(#gender, or: $value.gender),
      id: data.get(#id, or: $value.id),
      knownForDepartment:
          data.get(#knownForDepartment, or: $value.knownForDepartment),
      name: data.get(#name, or: $value.name),
      originalName: data.get(#originalName, or: $value.originalName),
      popularity: data.get(#popularity, or: $value.popularity),
      profilePath: data.get(#profilePath, or: $value.profilePath),
      creditId: data.get(#creditId, or: $value.creditId),
      department: data.get(#department, or: $value.department),
      job: data.get(#job, or: $value.job));

  @override
  FilmCrewModelCopyWith<$R2, FilmCrewModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilmCrewModelCopyWithImpl($value, $cast, t);
}
