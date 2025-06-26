import 'package:film_magic/features/film/presentation/views/widgets/film_category_switcher.dart';
import 'package:film_magic/features/film/presentation/views/widgets/film_horizontal_genre_chips.dart';
import 'package:film_magic/features/film/presentation/views/widgets/films_grid_view.dart';
import 'package:film_magic/features/film/presentation/views/widgets/films_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:film_magic/features/film/presentation/viewmodels/film_viewmodel.dart';

import '../../../../shared/widgets/input_fields.dart';

class FilmScreen extends StatefulWidget {
  const FilmScreen({super.key});

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load films when the screen is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FilmViewModel>().loadAllFilms();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();

    final isLoading = filmViewModel.isLoading;
    final errorMessage = filmViewModel.errorMessage;

    if (errorMessage != null) {
      return Center(child: Text('Error: $errorMessage'));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Explore'), centerTitle: false),
      body: RefreshIndicator(
        onRefresh: () => filmViewModel.loadAllFilms(),
        child: Column(
          children: [
            // Filter section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    controller: _searchController,
                    hintText: 'Search films...',
                    suffixIcon: _searchController.text.isEmpty
                        ? const Icon(Icons.search)
                        : IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _searchController.clear();
                              filmViewModel.setSearchQuery('');
                              FocusScope.of(context).unfocus();
                            },
                          ),
                    onChanged: (value) {
                      filmViewModel.setSearchQuery(value);
                    },
                  ),
                  FilmCategorySwitcher(),
                  FilmHorizontalGenreChips(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${filmViewModel.filteredFilms.length} films',
                          ),
                        ),
                        Row(
                          children: filmViewModel.displayViews.map((view) {
                            return IconButton(
                              onPressed: () =>
                                  filmViewModel.setSelectedView(view),
                              icon: Icon(
                                view.isSelected ? view.selectedIcon : view.icon,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Results section
            Expanded(
              child: isLoading && filmViewModel.filteredFilms.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : filmViewModel.filteredFilms.isEmpty
                  ? const Center(child: Text('No films match your filters'))
                  : filmViewModel.selectedView.name == 'List'
                  ? FilmsListView(films: filmViewModel.filteredFilms)
                  : FilmsGridView(films: filmViewModel.filteredFilms),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: filmViewModel.hasFilters
          ? FilledButton.icon(
              onPressed: () {
                _searchController.clear();
                filmViewModel.clearFilters();
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.clear_all),
              label: const Text('Clear'),
            )
          : null,
    );
  }
}
