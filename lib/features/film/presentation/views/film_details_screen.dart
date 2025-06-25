import 'package:film_magic/features/film/presentation/views/widgets/film_cast_list.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_additional_info.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_cover.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_detail_overview.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_detail_viewmodel.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen({super.key, required this.filmId});

  final int filmId;

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
    await filmDetailViewModel.loadFilmDetails(widget.filmId);
    await filmDetailViewModel.loadFilmCredits(widget.filmId);
    await filmDetailViewModel.loadSimilarFilms(widget.filmId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: FutureBuilder(
          future: _loadFilmDetailsFuture,
          builder: (context, snapshot) {
            return Consumer<FilmDetailViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
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
                              _loadFilmDetailsFuture = loadFilmDetails();
                            });
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                final filmDetails = viewModel.filmDetails;
                if (filmDetails == null) {
                  return const Center(child: Text('No film details available'));
                }

                return _buildFilmDetails(filmDetails, viewModel);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilmDetails(
    FilmDetailModel film,
    FilmDetailViewModel viewModel,
  ) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300.0,
          automaticallyImplyLeading: false,
          leading: Card(
            color: Colors.black.withValues(alpha: 0.5),
            shape: const CircleBorder(),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
          ),
          flexibleSpace: FilmDetailCover(filmDetail: film),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilmDetailOverview(film: film),
                FilmCastList(filmCredits: viewModel.filmCredits),
                FilmDetailAdditionalInfo(film: film),
                FilmList(
                  title: 'More Like This',
                  films: viewModel.similarFilms!.results,
                  isLoading: viewModel.isLoading,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
