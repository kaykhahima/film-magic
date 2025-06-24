import 'package:flutter/material.dart';

class FilmDetailsScreen extends StatelessWidget {
  const FilmDetailsScreen({super.key, required this.filmId});

  final String filmId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FilmDetailsScreen')),
      body: Center(child: Text('FilmDetailsScreen')),
    );
  }
}
