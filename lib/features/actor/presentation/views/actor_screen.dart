import 'package:flutter/material.dart';

class ActorDetailsScreen extends StatelessWidget {
  const ActorDetailsScreen({super.key, required this.actorId});

  final String actorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ActorDetailsScreen')),
      body: Center(child: Text('ActorDetailsScreen')),
    );
  }
}
