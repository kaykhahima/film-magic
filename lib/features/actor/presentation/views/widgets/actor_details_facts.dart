import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/actor_detail_model.dart';

class ActorDetailsFacts extends StatelessWidget {
  const ActorDetailsFacts({super.key, required this.actor});

  final ActorDetailModel actor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Facts', style: Theme.of(context).textTheme.titleLarge),
          const Gap(16),
          // Birthday
          if (actor.birthday != null)
            _buildInfoRow('Birthday', actor.birthday!),

          // Place of birth
          if (actor.placeOfBirth != null)
            _buildInfoRow('Place of Birth', actor.placeOfBirth!),

          // Death day (if applicable)
          if (actor.deathday != null) _buildInfoRow('Died', actor.deathday!),
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
}
