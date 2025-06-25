// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'genre_list_model.dart';

class GenreListModelMapper extends ClassMapperBase<GenreListModel> {
  GenreListModelMapper._();

  static GenreListModelMapper? _instance;
  static GenreListModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenreListModelMapper._());
      GenreMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GenreListModel';

  static List<Genre> _$genres(GenreListModel v) => v.genres;
  static const Field<GenreListModel, List<Genre>> _f$genres =
      Field('genres', _$genres);

  @override
  final MappableFields<GenreListModel> fields = const {
    #genres: _f$genres,
  };

  static GenreListModel _instantiate(DecodingData data) {
    return GenreListModel(genres: data.dec(_f$genres));
  }

  @override
  final Function instantiate = _instantiate;

  static GenreListModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GenreListModel>(map);
  }

  static GenreListModel fromJson(String json) {
    return ensureInitialized().decodeJson<GenreListModel>(json);
  }
}

mixin GenreListModelMappable {
  String toJson() {
    return GenreListModelMapper.ensureInitialized()
        .encodeJson<GenreListModel>(this as GenreListModel);
  }

  Map<String, dynamic> toMap() {
    return GenreListModelMapper.ensureInitialized()
        .encodeMap<GenreListModel>(this as GenreListModel);
  }

  GenreListModelCopyWith<GenreListModel, GenreListModel, GenreListModel>
      get copyWith => _GenreListModelCopyWithImpl(
          this as GenreListModel, $identity, $identity);
  @override
  String toString() {
    return GenreListModelMapper.ensureInitialized()
        .stringifyValue(this as GenreListModel);
  }

  @override
  bool operator ==(Object other) {
    return GenreListModelMapper.ensureInitialized()
        .equalsValue(this as GenreListModel, other);
  }

  @override
  int get hashCode {
    return GenreListModelMapper.ensureInitialized()
        .hashValue(this as GenreListModel);
  }
}

extension GenreListModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GenreListModel, $Out> {
  GenreListModelCopyWith<$R, GenreListModel, $Out> get $asGenreListModel =>
      $base.as((v, t, t2) => _GenreListModelCopyWithImpl(v, t, t2));
}

abstract class GenreListModelCopyWith<$R, $In extends GenreListModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Genre, GenreCopyWith<$R, Genre, Genre>> get genres;
  $R call({List<Genre>? genres});
  GenreListModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GenreListModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GenreListModel, $Out>
    implements GenreListModelCopyWith<$R, GenreListModel, $Out> {
  _GenreListModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GenreListModel> $mapper =
      GenreListModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Genre, GenreCopyWith<$R, Genre, Genre>> get genres =>
      ListCopyWith($value.genres, (v, t) => v.copyWith.$chain(t),
          (v) => call(genres: v));
  @override
  $R call({List<Genre>? genres}) =>
      $apply(FieldCopyWithData({if (genres != null) #genres: genres}));
  @override
  GenreListModel $make(CopyWithData data) =>
      GenreListModel(genres: data.get(#genres, or: $value.genres));

  @override
  GenreListModelCopyWith<$R2, GenreListModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GenreListModelCopyWithImpl($value, $cast, t);
}

class GenreMapper extends ClassMapperBase<Genre> {
  GenreMapper._();

  static GenreMapper? _instance;
  static GenreMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenreMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Genre';

  static int _$id(Genre v) => v.id;
  static const Field<Genre, int> _f$id = Field('id', _$id);
  static String _$name(Genre v) => v.name;
  static const Field<Genre, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Genre> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Genre _instantiate(DecodingData data) {
    return Genre(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Genre fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Genre>(map);
  }

  static Genre fromJson(String json) {
    return ensureInitialized().decodeJson<Genre>(json);
  }
}

mixin GenreMappable {
  String toJson() {
    return GenreMapper.ensureInitialized().encodeJson<Genre>(this as Genre);
  }

  Map<String, dynamic> toMap() {
    return GenreMapper.ensureInitialized().encodeMap<Genre>(this as Genre);
  }

  GenreCopyWith<Genre, Genre, Genre> get copyWith =>
      _GenreCopyWithImpl(this as Genre, $identity, $identity);
  @override
  String toString() {
    return GenreMapper.ensureInitialized().stringifyValue(this as Genre);
  }

  @override
  bool operator ==(Object other) {
    return GenreMapper.ensureInitialized().equalsValue(this as Genre, other);
  }

  @override
  int get hashCode {
    return GenreMapper.ensureInitialized().hashValue(this as Genre);
  }
}

extension GenreValueCopy<$R, $Out> on ObjectCopyWith<$R, Genre, $Out> {
  GenreCopyWith<$R, Genre, $Out> get $asGenre =>
      $base.as((v, t, t2) => _GenreCopyWithImpl(v, t, t2));
}

abstract class GenreCopyWith<$R, $In extends Genre, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name});
  GenreCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GenreCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Genre, $Out>
    implements GenreCopyWith<$R, Genre, $Out> {
  _GenreCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Genre> $mapper = GenreMapper.ensureInitialized();
  @override
  $R call({int? id, String? name}) => $apply(FieldCopyWithData(
      {if (id != null) #id: id, if (name != null) #name: name}));
  @override
  Genre $make(CopyWithData data) => Genre(
      id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  GenreCopyWith<$R2, Genre, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GenreCopyWithImpl($value, $cast, t);
}
