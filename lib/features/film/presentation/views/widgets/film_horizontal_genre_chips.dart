import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/film_viewmodel.dart';

class FilmHorizontalGenreChips extends StatelessWidget {
  const FilmHorizontalGenreChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();
    final genres = filmViewModel.genres!.genres;
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListView.builder(
        itemCount: genres.length,
        padding: const EdgeInsets.only(right: 8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = filmViewModel.selectedGenreIds.contains(genre.id);
          return Container(
            padding: const EdgeInsets.only(right: 4.0),
            child: ChoiceChip(
              label: Text(genre.name),
              selected: isSelected,
              onSelected: (value) {
                filmViewModel.toggleGenreSelection(genre.id);
              },
            ),
          );
        },
      ),
    );
  }
}
