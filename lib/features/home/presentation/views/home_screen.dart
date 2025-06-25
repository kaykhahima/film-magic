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
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
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
                    title: 'Now Playing',
                    films: filmViewModel.nowPlayingFilms!.results,
                    isLoading: isLoading,
                  ),
                if (filmViewModel.popularFilms != null)
                  FilmList(
                    title: 'Popular',
                    films: filmViewModel.popularFilms!.results,
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
