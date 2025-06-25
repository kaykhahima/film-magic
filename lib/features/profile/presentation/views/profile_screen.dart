import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

import '../../../authentication/data/models/user_model.dart';
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
              padding: const EdgeInsets.all(16.0),
              children: [
                // User info section
                Center(
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Appearance',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Gap(16),
                        _buildThemeOption(
                          context,
                          title: 'System Default',
                          subtitle: 'Follow system settings',
                          icon: Icons.brightness_auto,
                          isSelected:
                              authViewModel.themePreference ==
                              ThemePreference.systemDefault,
                          onTap: () => authViewModel.updateThemePreference(
                            ThemePreference.systemDefault,
                          ),
                        ),
                        const Divider(),
                        _buildThemeOption(
                          context,
                          title: 'Light',
                          subtitle: 'Light theme',
                          icon: Icons.light_mode,
                          isSelected:
                              authViewModel.themePreference ==
                              ThemePreference.light,
                          onTap: () => authViewModel.updateThemePreference(
                            ThemePreference.light,
                          ),
                        ),
                        const Divider(),
                        _buildThemeOption(
                          context,
                          title: 'Dark',
                          subtitle: 'Dark theme',
                          icon: Icons.dark_mode,
                          isSelected:
                              authViewModel.themePreference ==
                              ThemePreference.dark,
                          onTap: () => authViewModel.updateThemePreference(
                            ThemePreference.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? const Icon(Icons.check, color: Colors.green)
          : null,
      onTap: onTap,
    );
  }
}
