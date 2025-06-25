import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';

import 'film_container.dart';

class FilmList extends StatelessWidget {
  final String title;
  final List<FilmModel> films;
  final bool isLoading;

  const FilmList({
    super.key,
    required this.title,
    required this.films,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 200,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    final film = films[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: FilmContainer(film: film),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
