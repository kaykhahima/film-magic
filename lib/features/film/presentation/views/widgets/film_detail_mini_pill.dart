import 'package:flutter/material.dart';

class FilmDetailMiniPill extends StatelessWidget {
  const FilmDetailMiniPill({
    super.key,
    required this.voteAverage,
    required this.year,
    required this.adult,
  });

  final double voteAverage;
  final int year;
  final bool adult;

  @override
  Widget build(BuildContext context) {
    final String ratingText = adult ? 'R' : 'PG-13';
    final String yearText = year.toString();
    final bool isVoted = voteAverage > 0;
    final String votes = voteAverage.toStringAsFixed(1);

    final description = isVoted
        ? '⭐️ $votes | $yearText | $ratingText'
        : '$ratingText | $yearText';

    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
