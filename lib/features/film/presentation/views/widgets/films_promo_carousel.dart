import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/models/film_list_model.dart';
import '../../viewmodels/film_viewmodel.dart';
import 'film_promo_card.dart';

class FilmsPromoCarousel extends StatelessWidget {
  const FilmsPromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();
    List<FilmModel>? carouselFilms = filmViewModel.upcomingFilms?.results;
    if (carouselFilms == null || carouselFilms.isEmpty) {
      return const Center(child: Text('No films available'));
    }

    // //limit the number of films to 5
    // if (carouselFilms.length > 5) {
    //   carouselFilms = carouselFilms.sublist(10, 15);
    // }

    return ExpandableCarousel(
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
      items: carouselFilms.map((film) {
        return FilmPromoCard(film: film);
      }).toList(),
    );
  }
}
