import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../authentication/presentation/viewmodels/auth_viewmodel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreen'),
        actions: [
          TextButton(
            onPressed: () => authViewModel.signOut(),
            child: Text('Logout'),
          ),
        ],
      ),
      body: Center(child: Text('ProfileScreen')),
    );
  }
}
