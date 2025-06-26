import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_container.dart';
import 'package:flutter/material.dart';

class FilmsGridView extends StatelessWidget {
  const FilmsGridView({super.key, required this.films});

  final List<FilmModel> films;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: films.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return FilmContainer(
          film: films[index],
          width: MediaQuery.of(context).size.width / 2 - 20,
        );
      },
    );
  }
}
