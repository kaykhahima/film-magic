import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_helper.dart';
import '../../../../film/data/models/film_credits_model.dart';

class ActorDetailCover extends StatelessWidget {
  const ActorDetailCover({super.key, required this.actor});

  final FilmCastModel actor;

  @override
  Widget build(BuildContext context) {
    const double height = 370;
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: AppHelper.buildImageUrl(actor.profilePath ?? ''),
            imageBuilder: (context, imageProvider) {
              return Hero(
                tag: actor.id,
                child: Image(
                  image: imageProvider,
                  height: height,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              );
            },
            placeholder: (context, url) => SizedBox(),
            errorWidget: (context, url, error) => SizedBox(),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   child: Container(
        //     height: height,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       gradient: LinearGradient(
        //         begin: FractionalOffset.topCenter,
        //         end: FractionalOffset.bottomCenter,
        //         colors: [
        //           Colors.transparent,
        //           Colors.black.withValues(alpha: 0.5),
        //           Colors.black,
        //         ],
        //         stops: const [0.0, 0.8, 1.0],
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 20,
        //   child: SizedBox(
        //     height: height,
        //     width: MediaQuery.of(context).size.width,
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
        //       child: Column(
        //         spacing: 4.0,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [PopularityPill(popularity: actor.popularity!)],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
