import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:flutter/material.dart';

class FilmDetailOverview extends StatelessWidget {
  const FilmDetailOverview({super.key, required this.film});

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${film.title} (${film.releaseDate.substring(0, 4)})',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(film.overview),
        ],
      ),
    );
  }
}
