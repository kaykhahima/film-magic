import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../features/authentication/data/models/user_model.dart';
import '../../../features/authentication/presentation/viewmodels/auth_viewmodel.dart';

class ThemeSelectorList extends StatelessWidget {
  const ThemeSelectorList({super.key, this.onThemeSelected});

  final void Function(ThemePreference)? onThemeSelected;

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final themePrefs = ThemePreference.values;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0.0),
      itemCount: themePrefs.length,
      itemBuilder: (context, index) {
        final themePref = themePrefs[index];
        final isSelected = authViewModel.themePreference == themePref;
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              color: isSelected
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).dividerColor,
            ),
          ),
          leading: SizedBox(width: 40, child: Icon(themePref.icon, size: 30)),
          trailing: isSelected
              ? Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : null,
          onTap: () {
            authViewModel.updateThemePreference(themePref);
            if (onThemeSelected != null) {
              onThemeSelected!(themePref);
            }
          },

          title: Text(themePref.name.capitalize),
          subtitle: Text(themePref.description),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gap(8.0);
      },
    );
  }
}
