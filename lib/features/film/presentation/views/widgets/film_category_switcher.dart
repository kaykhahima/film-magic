import 'package:film_magic/core/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../shared/widgets/dynamic_radio_list.dart';
import '../../../../../shared/widgets/secondary_dropdown_button.dart';
import '../../viewmodels/film_viewmodel.dart';

class FilmCategorySwitcher extends StatelessWidget {
  const FilmCategorySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final filmViewModel = context.watch<FilmViewModel>();
    final categories = filmViewModel.categoryOptions;

    return SecondaryDropdownButton(
      selectedValue: filmViewModel.selectedCategory,
      onTap: () => _showCategoryList(context, filmViewModel, categories),
    );
  }

  _showCategoryList(
    BuildContext context,
    FilmViewModel filmViewModel,
    List<String> categories,
  ) {
    AppHelper.launchBottomsheet(
      context: context,
      title: 'Film Categories',
      subtitle: 'Tap to select a film category',
      children: [
        SizedBox(
          height: 200,
          child: DynamicRadioList<String>(
            items: categories,
            selectedValue: filmViewModel.selectedCategory,
            isSearchable: false,
            onSelected: (String? category) {
              if (category != null) {
                filmViewModel.setSelectedCategory(category);
              }
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
