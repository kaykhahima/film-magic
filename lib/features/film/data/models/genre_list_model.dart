import 'package:dart_mappable/dart_mappable.dart';

part 'genre_list_model.mapper.dart';

@MappableClass()
class GenreListModel with GenreListModelMappable {
  final List<Genre> genres;

  GenreListModel({required this.genres});
}

@MappableClass()
class Genre with GenreMappable {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}
