import 'package:film_magic/features/film/presentation/views/widgets/film_cast_list.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_additional_info.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_cover.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_overview.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_detail_viewmodel.dart';

import '../../data/models/film_list_model.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen({super.key, required this.film});

  final FilmModel film;

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  late Future _loadFilmDetailsFuture;

  @override
  void initState() {
    _loadFilmDetailsFuture = loadFilmDetails();
    super.initState();
  }

  Future<void> loadFilmDetails() async {
    final filmDetailViewModel = context.read<FilmDetailViewModel>();
    await filmDetailViewModel.loadFilmDetails(widget.film.id);
    await filmDetailViewModel.loadFilmCredits(widget.film.id);
    await filmDetailViewModel.loadSimilarFilms(widget.film.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.sizeOf(context).height * 0.35,
              automaticallyImplyLeading: false,
              leading: Card(
                color: Colors.black.withValues(alpha: 0.5),
                shape: const CircleBorder(),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => context.pop(),
                ),
              ),
              flexibleSpace: FilmDetailCover(film: widget.film),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consumer<FilmDetailViewModel>(
                  builder: (context, viewModel, _) {
                    return FutureBuilder(
                      future: _loadFilmDetailsFuture,
                      builder: (context, snapshot) {
                        if (viewModel.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (viewModel.errorMessage != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${viewModel.errorMessage}',
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                FilledButton(
                                  onPressed: () {
                                    setState(() {
                                      _loadFilmDetailsFuture =
                                          loadFilmDetails();
                                    });
                                  },
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        if (viewModel.filmDetails == null) {
                          return const Center(
                            child: Text('Film details not found.'),
                          );
                        }

                        final film = viewModel.filmDetails!;

                        return Column(
                          spacing: 16.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FilmDetailOverview(film: film),
                            FilmCastList(filmCredits: viewModel.filmCredits),
                            FilmDetailAdditionalInfo(film: film),
                            FilmList(
                              title: 'More Like This',
                              films: viewModel.similarFilms,
                              isLoading: viewModel.isLoading,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
