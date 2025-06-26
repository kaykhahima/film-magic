import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../viewmodels/film_viewmodel.dart';
import 'film_promo_card.dart';

class FilmsPromoCarousel extends StatelessWidget {
  const FilmsPromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();

    final results = filmViewModel.isLoading
        ? filmViewModel.dummyResults
        : filmViewModel.popularFilms?.results;

    return Skeletonizer(
      enabled: filmViewModel.isLoading || results == null || results.isEmpty,
      child: ExpandableCarousel(
        options: ExpandableCarouselOptions(
          viewportFraction: 1.0,
          autoPlay: true,
          showIndicator: false,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 4),
          slideIndicator: CircularStaticIndicator(
            slideIndicatorOptions: SlideIndicatorOptions(
              alignment: Alignment.bottomRight,
              indicatorRadius: 5.0,
              itemSpacing: 15.0,
              currentIndicatorColor: Colors.white,
              indicatorBackgroundColor: Colors.white54,
              padding: const EdgeInsets.only(right: 16, bottom: 24.0),
            ),
          ),
        ),
        items: results?.reversed.map((film) {
          return FilmPromoCard(film: film);
        }).toList(),
      ),
    );
  }
}
