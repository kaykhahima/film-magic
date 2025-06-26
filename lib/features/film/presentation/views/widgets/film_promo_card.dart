import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/core/navigation/app_router.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_helper.dart';
import 'film_rate_pill.dart';
import 'genres_pill.dart';

class FilmPromoCard extends StatelessWidget {
  const FilmPromoCard({super.key, required this.film});

  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    const double height = 370;
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
          bottom: 30,
          child: SizedBox(
            height: height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      spacing: 4.0,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FilmRatePill(rating: film.voteAverage),
                        Text(
                          film.title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                        GenresPill(genreIds: film.genreIds),
                      ],
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () =>
                        context.push(AppRouter.filmDetailsRoute, extra: film),
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
