import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_magic/core/utils/app_helper.dart';
import 'package:film_magic/features/profile/presentation/views/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/widgets/theme_selector_list.dart';
import '../../../authentication/presentation/viewmodels/auth_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    final user = authViewModel.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => authViewModel.signOut(),
            child: const Text('Logout'),
          ),
        ],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: user.imageUrl!,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 50,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, _) => CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 50),
                        ),
                        errorWidget: (context, _, __) => CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.person, size: 50),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const Gap(32),
                // Theme selection section
                ProfileTile(
                  title: 'Appearance',
                  leadingIcon: Icons.contrast,
                  value: authViewModel.themePreference.name,
                  onTap: () => _showThemeSelector(context),
                ),
              ],
            ),
    );
  }

  _showThemeSelector(BuildContext context) {
    AppHelper.launchBottomsheet(
      context: context,
      title: 'Appearance',
      subtitle: 'Select your preferred appearance',
      children: [ThemeSelectorList(onThemeSelected: (_) => context.pop())],
    );
  }
}
