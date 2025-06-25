import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilmDetailAdditionalInfo extends StatelessWidget {
  const FilmDetailAdditionalInfo({super.key, required this.film});

  final FilmDetailModel film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Additional Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(16),
          _buildInfoRow('Status', film.status),
          _buildInfoRow(
            'Original Language',
            film.originalLanguage.toUpperCase(),
          ),
          _buildInfoRow('Budget', '\$${_formatCurrency(film.budget)}'),
          _buildInfoRow('Revenue', '\$${_formatCurrency(film.revenue)}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  String _formatCurrency(int amount) {
    if (amount == 0) return 'N/A';

    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(1)}B';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return amount.toString();
    }
  }
}
