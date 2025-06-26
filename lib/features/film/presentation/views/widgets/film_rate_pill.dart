import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FilmRatePill extends StatelessWidget {
  const FilmRatePill({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(Icons.star, color: Colors.amber, size: 25.0),
            ),
            Text(
              rating.toStringAsFixed(1),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
