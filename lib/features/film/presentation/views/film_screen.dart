import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_viewmodel.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_list.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Films')),
      body: Consumer<FilmViewModel>(
        builder: (context, filmViewModel, child) {
          final isLoading = filmViewModel.isLoading;
          final errorMessage = filmViewModel.errorMessage;

          if (errorMessage != null) {
            return Center(child: Text('Error: $errorMessage'));
          }

          return RefreshIndicator(
            onRefresh: () => filmViewModel.loadAllFilms(),
            child: ListView(
              children: [
                if (filmViewModel.nowPlayingFilms != null)
                  FilmList(
                    title: 'Currently Playing',
                    films: filmViewModel.nowPlayingFilms!.results,
                    isLoading: isLoading,
                  ),
                if (filmViewModel.popularFilms != null)
                  FilmList(
                    title: 'Popular Films',
                    films: filmViewModel.popularFilms!.results,
                    isLoading: isLoading,
                  ),
                if (filmViewModel.topRatedFilms != null)
                  FilmList(
                    title: 'Top Rated',
                    films: filmViewModel.topRatedFilms!.results,
                    isLoading: isLoading,
                  ),
                if (filmViewModel.upcomingFilms != null)
                  FilmList(
                    title: 'New & Upcoming',
                    films: filmViewModel.upcomingFilms!.results,
                    isLoading: isLoading,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
