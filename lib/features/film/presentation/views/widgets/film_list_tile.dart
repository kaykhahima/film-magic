import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/utils/app_helper.dart';
import '../../../data/models/film_list_model.dart';

class FilmListTile extends StatelessWidget {
  const FilmListTile({super.key, required this.film});

  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 4.0,
      ),
      leading: CachedNetworkImage(
        imageUrl: AppHelper.buildImageUrl(film.posterPath ?? ''),
        imageBuilder: (context, imageProvider) {
          return Hero(
            tag: film.id,
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
        placeholder: (context, url) =>
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        errorWidget: (context, url, error) =>
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
      ),
      title: Text(film.title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(
        film.releaseDate,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () => context.push(AppRouter.filmDetailsRoute, extra: film),
    );
  }
}
