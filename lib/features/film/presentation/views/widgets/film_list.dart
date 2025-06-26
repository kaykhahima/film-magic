import 'package:film_magic/core/navigation/app_router.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_header.dart';
import 'package:flutter/material.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/film_viewmodel.dart';
import 'film_container.dart';

class FilmList extends StatelessWidget {
  final String title;
  final FilmListModel? films;
  final bool isLoading;

  const FilmList({
    super.key,
    required this.title,
    required this.films,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (films == null) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: FilmHeader(
            title: title,
            onTap: () {
              final filmViewModel = context.read<FilmViewModel>();
              filmViewModel.setSelectedCategory(title);
              context.go(AppRouter.filmsRoute);
            },
          ),
        ),
        Gap(8.0),
        SizedBox(
          height: 200,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: films!.results.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    final film = films!.results[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilmContainer(film: film),
                    );
                  },
                ),
        ),
        Gap(12.0),
      ],
    );
  }
}
