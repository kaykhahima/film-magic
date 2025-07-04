import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      onTap: () => context.push(AppRouter.filmDetailsRoute, extra: film),
      child: Skeleton.leaf(
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
                  useOldImageOnUrlChange: true,
                  imageUrl: AppHelper.buildImageUrl(film.posterPath ?? ''),
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                  placeholder: (context, url) => SizedBox(),
                  errorWidget: (context, url, error) => SizedBox(),
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      Container(
                        width: width,
                        height: 35,
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
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
