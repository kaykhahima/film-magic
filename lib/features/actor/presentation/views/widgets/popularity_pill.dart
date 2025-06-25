import 'package:flutter/material.dart';

class PopularityPill extends StatelessWidget {
  const PopularityPill({super.key, this.popularity});

  final double? popularity;

  @override
  Widget build(BuildContext context) {
    return popularity != null
        ? Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Text(
                  'Popularity: ${(popularity! * 100.0).toStringAsFixed(0)} %',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
