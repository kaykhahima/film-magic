import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';

abstract class ActorRepository {
  /// Retrieves detailed information for a specific actor
  ///
  /// [actorId] - The ID of the actor to retrieve details for
  Future<ActorDetailModel> getActorDetails(int actorId);
}