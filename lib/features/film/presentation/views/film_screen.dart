import 'package:flutter/material.dart';

class FilmScreen extends StatelessWidget {
  const FilmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FilmScreen')),
      body: Center(child: Text('FilmScreen')),
    );
  }
}
