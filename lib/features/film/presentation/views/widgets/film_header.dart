import 'package:flutter/material.dart';

class FilmHeader extends StatelessWidget {
  const FilmHeader({super.key, required this.title, this.icon, this.onTap});

  final String title;
  final Icon? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        if (onTap != null)
          IconButton(
            icon:
                icon ??
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            onPressed: onTap,
            tooltip: 'More',
          ),
      ],
    );
  }
}
