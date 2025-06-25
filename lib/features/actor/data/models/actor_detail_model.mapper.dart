// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'actor_detail_model.dart';

class ActorDetailModelMapper extends ClassMapperBase<ActorDetailModel> {
  ActorDetailModelMapper._();

  static ActorDetailModelMapper? _instance;
  static ActorDetailModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActorDetailModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ActorDetailModel';

  static bool _$adult(ActorDetailModel v) => v.adult;
  static const Field<ActorDetailModel, bool> _f$adult = Field('adult', _$adult);
  static List<String>? _$alsoKnownAs(ActorDetailModel v) => v.alsoKnownAs;
  static const Field<ActorDetailModel, List<String>> _f$alsoKnownAs =
      Field('alsoKnownAs', _$alsoKnownAs, key: r'also_known_as', opt: true);
  static String? _$biography(ActorDetailModel v) => v.biography;
  static const Field<ActorDetailModel, String> _f$biography =
      Field('biography', _$biography, opt: true);
  static String? _$birthday(ActorDetailModel v) => v.birthday;
  static const Field<ActorDetailModel, String> _f$birthday =
      Field('birthday', _$birthday, opt: true);
  static String? _$deathday(ActorDetailModel v) => v.deathday;
  static const Field<ActorDetailModel, String> _f$deathday =
      Field('deathday', _$deathday, opt: true);
  static int _$gender(ActorDetailModel v) => v.gender;
  static const Field<ActorDetailModel, int> _f$gender =
      Field('gender', _$gender);
  static String? _$homepage(ActorDetailModel v) => v.homepage;
  static const Field<ActorDetailModel, String> _f$homepage =
      Field('homepage', _$homepage, opt: true);
  static int _$id(ActorDetailModel v) => v.id;
  static const Field<ActorDetailModel, int> _f$id = Field('id', _$id);
  static String? _$imdbId(ActorDetailModel v) => v.imdbId;
  static const Field<ActorDetailModel, String> _f$imdbId =
      Field('imdbId', _$imdbId, key: r'imdb_id', opt: true);
  static String? _$knownForDepartment(ActorDetailModel v) =>
      v.knownForDepartment;
  static const Field<ActorDetailModel, String> _f$knownForDepartment = Field(
      'knownForDepartment', _$knownForDepartment,
      key: r'known_for_department', opt: true);
  static String _$name(ActorDetailModel v) => v.name;
  static const Field<ActorDetailModel, String> _f$name = Field('name', _$name);
  static String? _$placeOfBirth(ActorDetailModel v) => v.placeOfBirth;
  static const Field<ActorDetailModel, String> _f$placeOfBirth =
      Field('placeOfBirth', _$placeOfBirth, key: r'place_of_birth', opt: true);
  static double? _$popularity(ActorDetailModel v) => v.popularity;
  static const Field<ActorDetailModel, double> _f$popularity =
      Field('popularity', _$popularity, opt: true);
  static String? _$profilePath(ActorDetailModel v) => v.profilePath;
  static const Field<ActorDetailModel, String> _f$profilePath =
      Field('profilePath', _$profilePath, key: r'profile_path', opt: true);

  @override
  final MappableFields<ActorDetailModel> fields = const {
    #adult: _f$adult,
    #alsoKnownAs: _f$alsoKnownAs,
    #biography: _f$biography,
    #birthday: _f$birthday,
    #deathday: _f$deathday,
    #gender: _f$gender,
    #homepage: _f$homepage,
    #id: _f$id,
    #imdbId: _f$imdbId,
    #knownForDepartment: _f$knownForDepartment,
    #name: _f$name,
    #placeOfBirth: _f$placeOfBirth,
    #popularity: _f$popularity,
    #profilePath: _f$profilePath,
  };

  static ActorDetailModel _instantiate(DecodingData data) {
    return ActorDetailModel(
        adult: data.dec(_f$adult),
        alsoKnownAs: data.dec(_f$alsoKnownAs),
        biography: data.dec(_f$biography),
        birthday: data.dec(_f$birthday),
        deathday: data.dec(_f$deathday),
        gender: data.dec(_f$gender),
        homepage: data.dec(_f$homepage),
        id: data.dec(_f$id),
        imdbId: data.dec(_f$imdbId),
        knownForDepartment: data.dec(_f$knownForDepartment),
        name: data.dec(_f$name),
        placeOfBirth: data.dec(_f$placeOfBirth),
        popularity: data.dec(_f$popularity),
        profilePath: data.dec(_f$profilePath));
  }

  @override
  final Function instantiate = _instantiate;

  static ActorDetailModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActorDetailModel>(map);
  }

  static ActorDetailModel fromJson(String json) {
    return ensureInitialized().decodeJson<ActorDetailModel>(json);
  }
}

mixin ActorDetailModelMappable {
  String toJson() {
    return ActorDetailModelMapper.ensureInitialized()
        .encodeJson<ActorDetailModel>(this as ActorDetailModel);
  }

  Map<String, dynamic> toMap() {
    return ActorDetailModelMapper.ensureInitialized()
        .encodeMap<ActorDetailModel>(this as ActorDetailModel);
  }

  ActorDetailModelCopyWith<ActorDetailModel, ActorDetailModel, ActorDetailModel>
      get copyWith => _ActorDetailModelCopyWithImpl(
          this as ActorDetailModel, $identity, $identity);
  @override
  String toString() {
    return ActorDetailModelMapper.ensureInitialized()
        .stringifyValue(this as ActorDetailModel);
  }

  @override
  bool operator ==(Object other) {
    return ActorDetailModelMapper.ensureInitialized()
        .equalsValue(this as ActorDetailModel, other);
  }

  @override
  int get hashCode {
    return ActorDetailModelMapper.ensureInitialized()
        .hashValue(this as ActorDetailModel);
  }
}

extension ActorDetailModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActorDetailModel, $Out> {
  ActorDetailModelCopyWith<$R, ActorDetailModel, $Out>
      get $asActorDetailModel =>
          $base.as((v, t, t2) => _ActorDetailModelCopyWithImpl(v, t, t2));
}

abstract class ActorDetailModelCopyWith<$R, $In extends ActorDetailModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get alsoKnownAs;
  $R call(
      {bool? adult,
      List<String>? alsoKnownAs,
      String? biography,
      String? birthday,
      String? deathday,
      int? gender,
      String? homepage,
      int? id,
      String? imdbId,
      String? knownForDepartment,
      String? name,
      String? placeOfBirth,
      double? popularity,
      String? profilePath});
  ActorDetailModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActorDetailModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActorDetailModel, $Out>
    implements ActorDetailModelCopyWith<$R, ActorDetailModel, $Out> {
  _ActorDetailModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActorDetailModel> $mapper =
      ActorDetailModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get alsoKnownAs => $value.alsoKnownAs != null
          ? ListCopyWith(
              $value.alsoKnownAs!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(alsoKnownAs: v))
          : null;
  @override
  $R call(
          {bool? adult,
          Object? alsoKnownAs = $none,
          Object? biography = $none,
          Object? birthday = $none,
          Object? deathday = $none,
          int? gender,
          Object? homepage = $none,
          int? id,
          Object? imdbId = $none,
          Object? knownForDepartment = $none,
          String? name,
          Object? placeOfBirth = $none,
          Object? popularity = $none,
          Object? profilePath = $none}) =>
      $apply(FieldCopyWithData({
        if (adult != null) #adult: adult,
        if (alsoKnownAs != $none) #alsoKnownAs: alsoKnownAs,
        if (biography != $none) #biography: biography,
        if (birthday != $none) #birthday: birthday,
        if (deathday != $none) #deathday: deathday,
        if (gender != null) #gender: gender,
        if (homepage != $none) #homepage: homepage,
        if (id != null) #id: id,
        if (imdbId != $none) #imdbId: imdbId,
        if (knownForDepartment != $none)
          #knownForDepartment: knownForDepartment,
        if (name != null) #name: name,
        if (placeOfBirth != $none) #placeOfBirth: placeOfBirth,
        if (popularity != $none) #popularity: popularity,
        if (profilePath != $none) #profilePath: profilePath
      }));
  @override
  ActorDetailModel $make(CopyWithData data) => ActorDetailModel(
      adult: data.get(#adult, or: $value.adult),
      alsoKnownAs: data.get(#alsoKnownAs, or: $value.alsoKnownAs),
      biography: data.get(#biography, or: $value.biography),
      birthday: data.get(#birthday, or: $value.birthday),
      deathday: data.get(#deathday, or: $value.deathday),
      gender: data.get(#gender, or: $value.gender),
      homepage: data.get(#homepage, or: $value.homepage),
      id: data.get(#id, or: $value.id),
      imdbId: data.get(#imdbId, or: $value.imdbId),
      knownForDepartment:
          data.get(#knownForDepartment, or: $value.knownForDepartment),
      name: data.get(#name, or: $value.name),
      placeOfBirth: data.get(#placeOfBirth, or: $value.placeOfBirth),
      popularity: data.get(#popularity, or: $value.popularity),
      profilePath: data.get(#profilePath, or: $value.profilePath));

  @override
  ActorDetailModelCopyWith<$R2, ActorDetailModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActorDetailModelCopyWithImpl($value, $cast, t);
}
