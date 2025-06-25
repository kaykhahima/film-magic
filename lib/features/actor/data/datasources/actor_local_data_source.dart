import 'dart:convert';

import 'package:film_magic/core/database/database_helper.dart';
import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';

class ActorLocalDataSource {
  final DatabaseHelper _databaseHelper;

  ActorLocalDataSource(this._databaseHelper);

  Future<void> cacheActorDetails(ActorDetailModel actor) async {
    // Save the actor details
    await _databaseHelper.insert('actors', {
      'id': actor.id,
      'name': actor.name,
      'adult': actor.adult ? 1 : 0,
      'also_known_as': jsonEncode(actor.alsoKnownAs),
      'biography': actor.biography,
      'birthday': actor.birthday,
      'deathday': actor.deathday,
      'gender': actor.gender,
      'homepage': actor.homepage,
      'imdb_id': actor.imdbId,
      'known_for_department': actor.knownForDepartment,
      'place_of_birth': actor.placeOfBirth,
      'popularity': actor.popularity,
      'profile_path': actor.profilePath,
      'cached_at': DateTime.now().toIso8601String(),
    });
  }

  Future<ActorDetailModel?> getActorDetails(int actorId) async {
    final actorMaps = await _databaseHelper.query(
      'actors',
      where: 'id = ?',
      whereArgs: [actorId],
      limit: 1,
    );

    if (actorMaps.isEmpty) return null;

    final actorMap = actorMaps.first;
    return ActorDetailModel(
      adult: (actorMap['adult'] as int) == 1,
      alsoKnownAs: List<String>.from(jsonDecode(actorMap['also_known_as'] as String)),
      biography: actorMap['biography'] as String,
      birthday: actorMap['birthday'] as String,
      deathday: actorMap['deathday'] as String?,
      gender: actorMap['gender'] as int,
      homepage: actorMap['homepage'] as String?,
      id: actorMap['id'] as int,
      imdbId: actorMap['imdb_id'] as String,
      knownForDepartment: actorMap['known_for_department'] as String,
      name: actorMap['name'] as String,
      placeOfBirth: actorMap['place_of_birth'] as String,
      popularity: actorMap['popularity'] as double,
      profilePath: actorMap['profile_path'] as String,
    );
  }
}