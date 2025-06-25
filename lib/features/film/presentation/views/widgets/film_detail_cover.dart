import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_helper.dart';
import 'film_detail_mini_pill.dart';

class FilmDetailCover extends StatelessWidget {
  const FilmDetailCover({super.key, required this.filmDetail});

  final FilmDetailModel filmDetail;

  @override
  Widget build(BuildContext context) {
    const double height = 370;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: AppHelper.buildImageUrl(filmDetail.posterPath!),
            imageBuilder: (context, imageProvider) {
              return Hero(
                tag: filmDetail.id,
                child: Image(
                  image: imageProvider,
                  height: height,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
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
              child: Column(
                spacing: 4.0,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilmDetailMiniPill(
                    voteAverage: filmDetail.voteAverage,
                    year: DateTime.parse(filmDetail.releaseDate).year,
                    adult: filmDetail.adult,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          filmDetail.genres.map((g) => g.name).join(' · '),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      if (filmDetail.runtime > 0)
                        Text(
                          '${filmDetail.runtime} min',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                    ],
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
