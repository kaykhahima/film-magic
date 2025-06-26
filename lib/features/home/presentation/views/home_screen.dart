import 'package:film_magic/features/film/presentation/views/widgets/films_promo_carousel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_viewmodel.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load films when the screen is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FilmViewModel>().loadAllFilms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmViewModel>(
      builder: (context, filmViewModel, child) {
        final isLoading = filmViewModel.isLoading;
        final errorMessage = filmViewModel.errorMessage;

        if (errorMessage != null) {
          return Center(child: Text(errorMessage));
        }

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () => filmViewModel.loadAllFilms(),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: MediaQuery.sizeOf(context).height * 0.35,
                  flexibleSpace: FilmsPromoCarousel(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        FilmList(
                          title: filmViewModel.categoryOptions[1],
                          films: filmViewModel.popularFilms,
                          isLoading: isLoading,
                        ),
                        FilmList(
                          title: filmViewModel.categoryOptions[2],
                          films: filmViewModel.nowPlayingFilms,
                          isLoading: isLoading,
                        ),
                        FilmList(
                          title: filmViewModel.categoryOptions[3],
                          films: filmViewModel.upcomingFilms,
                          isLoading: isLoading,
                        ),
                        FilmList(
                          title: filmViewModel.categoryOptions[0],
                          films: filmViewModel.topRatedFilms,
                          isLoading: isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
