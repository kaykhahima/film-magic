import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_helper.dart';
import '../../../data/models/film_credits_model.dart';

class FilmCastList extends StatelessWidget {
  const FilmCastList({super.key, this.filmCredits});

  final FilmCreditsModel? filmCredits;

  @override
  Widget build(BuildContext context) {
    if (filmCredits == null || filmCredits!.cast.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cast', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filmCredits!.cast.length > 10
                  ? 10
                  : filmCredits!.cast.length,
              itemBuilder: (context, index) {
                final cast = filmCredits!.cast[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRouter.actorDetailsRoute, extra: cast.id);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: AppHelper.buildImageUrl(
                            cast.profilePath ?? '',
                          ),
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              radius: 40,
                              backgroundImage: imageProvider,
                            );
                          },
                          placeholder: (context, url) => CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person, size: 40),
                          ),
                          errorWidget: (context, url, error) => CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.person, size: 40),
                          ),
                        ),
                        const Gap(8.0),
                        SizedBox(
                          width: 80,
                          child: Text(
                            cast.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Text(
                            cast.character,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
