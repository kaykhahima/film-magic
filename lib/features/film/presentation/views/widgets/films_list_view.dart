import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';

import 'film_list_tile.dart';

class FilmsListView extends StatelessWidget {
  const FilmsListView({super.key, required this.films});

  final List<FilmModel> films;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: films.length,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (context, index) {
        return FilmListTile(film: films[index]);
      },
    );
  }
}
