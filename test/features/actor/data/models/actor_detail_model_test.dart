import 'dart:convert';

import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActorDetailModel', () {
    // Sample data based on provided JSON
    final actorDetailModel = ActorDetailModel(
      adult: false,
      alsoKnownAs: [
        "Scarlett Ingrid Johansson",
        "Σκάρλετ Τζοχάνσον",
        "스칼릿 조핸슨",
        "สการ์เลตต์ อิงกริด โจแฮนส์สัน",
        "สการ์เลตต์ โจแฮนสัน",
        "سكارليت جوهانسون",
        "اسکارلت جوهانسون",
        "اسکارلت یوهانسون",
      ],
      biography:
          "Scarlett Ingrid Johansson (born November 22, 1984) is an American actress. The world's highest-paid actress in 2018 and 2019, she has featured multiple times on the Forbes Celebrity 100 list. Her films have grossed over \$14.3 billion worldwide, making Johansson the ninth-highest-grossing box office star of all time. She has received various accolades, including a Tony Award and a British Academy Film Award, in addition to nominations for two Academy Awards and five Golden Globe Awards.",
      birthday: "1984-11-22",
      deathday: null,
      gender: 1,
      homepage: null,
      id: 1245,
      imdbId: "nm0424060",
      knownForDepartment: "Acting",
      name: "Scarlett Johansson",
      placeOfBirth: "New York City, New York, USA",
      popularity: 24.1544,
      profilePath: "/8m21eocprLYuW0ywveIgThk6VM.jpg",
    );

    // Sample JSON data as provided
    final Map<String, dynamic> jsonMap = {
      "adult": false,
      "also_known_as": [
        "Scarlett Ingrid Johansson",
        "Σκάρλετ Τζοχάνσον",
        "스칼릿 조핸슨",
        "สการ์เลตต์ อิงกริด โจแฮนส์สัน",
        "สการ์เลตต์ โจแฮนสัน",
        "سكارليت جوهانسون",
        "اسکارلت جوهانسون",
        "اسکارلت یوهانسون",
      ],
      "biography":
          "Scarlett Ingrid Johansson (born November 22, 1984) is an American actress. The world's highest-paid actress in 2018 and 2019, she has featured multiple times on the Forbes Celebrity 100 list. Her films have grossed over \$14.3 billion worldwide, making Johansson the ninth-highest-grossing box office star of all time. She has received various accolades, including a Tony Award and a British Academy Film Award, in addition to nominations for two Academy Awards and five Golden Globe Awards.",
      "birthday": "1984-11-22",
      "deathday": null,
      "gender": 1,
      "homepage": null,
      "id": 1245,
      "imdb_id": "nm0424060",
      "known_for_department": "Acting",
      "name": "Scarlett Johansson",
      "place_of_birth": "New York City, New York, USA",
      "popularity": 24.1544,
      "profile_path": "/8m21eocprLYuW0ywveIgThk6VM.jpg",
    };

    test('should convert ActorDetailModel to JSON and back', () {
      // Convert to JSON
      final jsonString = actorDetailModel.toJson();
      expect(jsonString, isA<String>());

      // Convert back from JSON
      final decodedModel = ActorDetailModelMapper.fromJson(jsonString);
      expect(decodedModel, isA<ActorDetailModel>());

      // Verify properties
      expect(decodedModel.id, equals(actorDetailModel.id));
      expect(decodedModel.name, equals(actorDetailModel.name));
      expect(decodedModel.biography, equals(actorDetailModel.biography));
      expect(decodedModel.birthday, equals(actorDetailModel.birthday));
      expect(decodedModel.deathday, equals(actorDetailModel.deathday));
      expect(decodedModel.gender, equals(actorDetailModel.gender));
      expect(decodedModel.popularity, equals(actorDetailModel.popularity));

      // Verify list property
      expect(
        decodedModel.alsoKnownAs!.length,
        equals(actorDetailModel.alsoKnownAs!.length),
      );
      for (int i = 0; i < decodedModel.alsoKnownAs!.length; i++) {
        expect(
          decodedModel.alsoKnownAs![i],
          equals(actorDetailModel.alsoKnownAs![i]),
        );
      }
    });

    test('should convert ActorDetailModel to Map and back', () {
      // Convert to Map
      final map = actorDetailModel.toMap();
      expect(map, isA<Map<String, dynamic>>());

      // Convert back from Map
      final decodedModel = ActorDetailModelMapper.fromMap(map);
      expect(decodedModel, isA<ActorDetailModel>());

      // Verify properties
      expect(decodedModel.id, equals(actorDetailModel.id));
      expect(decodedModel.name, equals(actorDetailModel.name));
      expect(decodedModel.biography, equals(actorDetailModel.biography));
      expect(decodedModel.birthday, equals(actorDetailModel.birthday));
      expect(decodedModel.deathday, equals(actorDetailModel.deathday));
      expect(decodedModel.gender, equals(actorDetailModel.gender));
      expect(decodedModel.popularity, equals(actorDetailModel.popularity));

      // Verify list property
      expect(
        decodedModel.alsoKnownAs!.length,
        equals(actorDetailModel.alsoKnownAs!.length),
      );
      for (int i = 0; i < decodedModel.alsoKnownAs!.length; i++) {
        expect(
          decodedModel.alsoKnownAs![i],
          equals(actorDetailModel.alsoKnownAs![i]),
        );
      }
    });

    test('should handle JSON from API response', () {
      final jsonString = json.encode(jsonMap);
      final decodedModel = ActorDetailModelMapper.fromJson(jsonString);

      // Verify basic properties
      expect(decodedModel.id, equals(1245));
      expect(decodedModel.name, equals("Scarlett Johansson"));
      expect(decodedModel.birthday, equals("1984-11-22"));
      expect(decodedModel.deathday, isNull);
      expect(decodedModel.gender, equals(1));
      expect(decodedModel.popularity, equals(24.1544));

      // Verify list property
      expect(decodedModel.alsoKnownAs!.length, equals(8));
      expect(decodedModel.alsoKnownAs![0], equals("Scarlett Ingrid Johansson"));

      // Verify biography (first part)
      expect(
        decodedModel.biography,
        startsWith("Scarlett Ingrid Johansson (born November 22, 1984)"),
      );
    });
  });
}
