import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../viewmodels/film_viewmodel.dart';
import 'film_list_tile.dart';

class FilmsListView extends StatelessWidget {
  const FilmsListView({super.key, required this.films});

  final List<FilmModel> films;

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();

    final films = filmViewModel.isLoading
        ? filmViewModel.dummyResults
        : this.films;

    return Skeletonizer(
      enabled: filmViewModel.isLoading,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: films.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) {
          return FilmListTile(film: films[index]);
        },
      ),
    );
  }
}
