import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/film_viewmodel.dart';

class GenresPill extends StatelessWidget {
  const GenresPill({super.key, required this.genreIds});

  final List<int> genreIds;

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmViewModel>(
      builder: (context, filmViewModel, _) {
        //get the genres from the filmViewModel
        final genres = filmViewModel.getGenresByIds(genreIds);

        return Container(
          height: 35,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView.separated(
            itemCount: genres.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final genre = genres[index];
              return Center(
                child: Text(
                  genre.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              );
            },
            separatorBuilder: (context, index) => const VerticalDivider(
              color: Colors.white54,
              endIndent: 8.0,
              indent: 8.0,
            ),
          ),
        );
      },
    );
  }
}
