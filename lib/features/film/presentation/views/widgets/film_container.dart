import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/navigation/app_router.dart';
import '../../../../../core/utils/app_helper.dart';

class FilmContainer extends StatelessWidget {
  const FilmContainer({
    super.key,
    required this.film,
    this.height = 200,
    this.width = 150,
  });

  final FilmModel film;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRouter.filmDetailsRoute, extra: film.id),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: AppHelper.buildImageUrl(film.posterPath ?? ''),
                imageBuilder: (context, imageProvider) {
                  return Image(
                    image: imageProvider,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                  );
                },
                placeholder: (context, url) => SizedBox(),
                errorWidget: (context, url, error) => SizedBox(),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 35,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      film.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
