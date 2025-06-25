import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';
import 'package:flutter/material.dart';

class ActorDetailOverview extends StatelessWidget {
  const ActorDetailOverview({super.key, required this.actor});

  final ActorDetailModel actor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(actor.name, style: Theme.of(context).textTheme.headlineMedium),
          Text(actor.biography ?? 'No biography available.'),
        ],
      ),
    );
  }
}
