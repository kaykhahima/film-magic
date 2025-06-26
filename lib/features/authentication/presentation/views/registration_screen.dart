import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/darkened_background.dart';
import '../viewmodels/auth_viewmodel.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    return Stack(
      children: [
        DarkenedBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    children: [
                      const Gap(50.0),
                      Text(
                        'Welcome to\nFilm Magic',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                if (authViewModel.isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (!authViewModel.isLoading)
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: FilledButton.icon(
                            onPressed: () => authViewModel.signInWithGoogle(),
                            label: const Text('Continue with Google'),
                            icon: const FaIcon(
                              FontAwesomeIcons.google,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (authViewModel.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      authViewModel.errorMessage!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Gap(12.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
