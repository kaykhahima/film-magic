import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/core/navigation/app_router.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_helper.dart';

class FilmPromoCard extends StatelessWidget {
  const FilmPromoCard({super.key, required this.film});

  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    const double height = 400 - kToolbarHeight;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: AppHelper.buildImageUrl(film.posterPath!),
            imageBuilder: (context, imageProvider) {
              return Image(
                image: imageProvider,
                height: height,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              );
            },
            placeholder: (context, url) => SizedBox(),
            errorWidget: (context, url, error) => SizedBox(),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black,
                ],
                stops: const [0.0, 0.8, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 28.0,
                              ),
                            ),
                            Text(
                              film.voteAverage.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        film.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Genres: ${film.genreIds.toString()}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton.filled(
                    onPressed: () => context.push(
                      AppRouter.filmDetailsRoute,
                      extra: film.id,
                    ),
                    icon: Icon(Icons.arrow_outward),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
