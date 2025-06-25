import 'dart:convert';

import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilmCreditsModel', () {
    final creditsResultJson = {
      "id": 574475,
      "cast": [
        {
          "adult": false,
          "gender": 1,
          "id": 3480304,
          "known_for_department": "Acting",
          "name": "Kaitlyn Santa Juana",
          "original_name": "Kaitlyn Santa Juana",
          "popularity": 8.2224,
          "profile_path": "/75Tdc3wg9mklJHy5LEj8OMjcPw8.jpg",
          "cast_id": 18,
          "character": "Stefani Reyes",
          "credit_id": "65f212be2fe2fa0148ecb133",
          "order": 0,
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1547148,
          "known_for_department": "Acting",
          "name": "Teo Briones",
          "original_name": "Teo Briones",
          "popularity": 5.1028,
          "profile_path": "/cyykbm4Xht2Pi7brr88FcmS1LPb.jpg",
          "cast_id": 16,
          "character": "Charlie Reyes",
          "credit_id": "65f212a506f984016243a480",
          "order": 1,
        },
        {
          "adult": false,
          "gender": 1,
          "id": 58724,
          "known_for_department": "Acting",
          "name": "Rya Kihlstedt",
          "original_name": "Rya Kihlstedt",
          "popularity": 2.4828,
          "profile_path": "/86ysgxNPkckt8jp715X79CdopB7.jpg",
          "cast_id": 23,
          "character": "Darlene Campbell",
          "credit_id": "6605f5f6d4fe04014926ae66",
          "order": 2,
        },
        {
          "adult": false,
          "gender": 2,
          "id": 144852,
          "known_for_department": "Acting",
          "name": "Richard Harmon",
          "original_name": "Richard Harmon",
          "popularity": 6.0518,
          "profile_path": "/OMc1TCt9GEJddnVI1o5BPIAoLV.jpg",
          "cast_id": 20,
          "character": "Erik",
          "credit_id": "65f3b5da3852020149e17b35",
          "order": 3,
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1482198,
          "known_for_department": "Acting",
          "name": "Owen Patrick Joyner",
          "original_name": "Owen Patrick Joyner",
          "popularity": 1.3155,
          "profile_path": "/eTZiPEsHZmmgQKEhC8HDf28sFmY.jpg",
          "cast_id": 17,
          "character": "Bobby",
          "credit_id": "65f212af99259c01865f0147",
          "order": 4,
        },
      ],
      "crew": [
        {
          "adult": false,
          "gender": 2,
          "id": 1181022,
          "known_for_department": "Directing",
          "name": "Zach Lipovsky",
          "original_name": "Zach Lipovsky",
          "popularity": 0.5368,
          "profile_path": "/hdRnSPmRjYpAEGrpddwxnfqGdmQ.jpg",
          "credit_id": "632e157855937b008e542f0c",
          "department": "Directing",
          "job": "Director",
        },
        {
          "adult": false,
          "gender": 2,
          "id": 1938317,
          "known_for_department": "Directing",
          "name": "Adam B. Stein",
          "original_name": "Adam B. Stein",
          "popularity": 0.482,
          "profile_path": "/aobQq1YDiny8Fmr9Sk1sh8SqcRM.jpg",
          "credit_id": "632e15654c1bb0007f327912",
          "department": "Directing",
          "job": "Director",
        },
        {
          "adult": false,
          "gender": 0,
          "id": 3379400,
          "known_for_department": "Production",
          "name": "Sheila Hanahan Taylor",
          "original_name": "Sheila Hanahan Taylor",
          "popularity": 0.1103,
          "profile_path": null,
          "credit_id": "61de7cbf5c071b0066ed2a26",
          "department": "Production",
          "job": "Producer",
        },
      ],
    };

    final filmCastModel = FilmCastModel(
      adult: false,
      gender: 1,
      id: 3480304,
      knownForDepartment: 'Acting',
      name: 'Kaitlyn Santa Juana',
      originalName: 'Kaitlyn Santa Juana',
      popularity: 8.2224,
      profilePath: '/path/to/profile.jpg',
      castId: 18,
      character: 'Stefani Reyes',
      creditId: '65f212be2fe2fa0148ecb133',
      order: 0,
    );

    final filmCrewModel = FilmCrewModel(
      adult: false,
      gender: 1,
      id: 456,
      knownForDepartment: 'Directing',
      name: 'Director Name',
      originalName: 'Director Original Name',
      popularity: 7.5,
      profilePath: '/path/to/director_profile.jpg',
      creditId: 'credit456',
      department: 'Directing',
      job: 'Director',
    );

    final filmCreditsModel = FilmCreditsModel(
      id: '789',
      cast: [filmCastModel],
      crew: [filmCrewModel],
    );

    test('should convert FilmCreditsModel to JSON and back', () {
      // Convert to JSON
      final jsonString = filmCreditsModel.toJson();
      expect(jsonString, isA<String>());

      // Convert back from JSON
      final decodedModel = FilmCreditsModelMapper.fromJson(jsonString);
      expect(decodedModel, isA<FilmCreditsModel>());

      // Verify properties
      expect(decodedModel.id, equals(filmCreditsModel.id));
      expect(decodedModel.cast.length, equals(filmCreditsModel.cast.length));
      expect(decodedModel.crew.length, equals(filmCreditsModel.crew.length));

      // Verify nested FilmCastModel
      final decodedCast = decodedModel.cast.first;
      expect(decodedCast.id, equals(filmCastModel.id));
      expect(decodedCast.name, equals(filmCastModel.name));
      expect(decodedCast.character, equals(filmCastModel.character));
      expect(decodedCast.order, equals(filmCastModel.order));

      // Verify nested FilmCrewModel
      final decodedCrew = decodedModel.crew.first;
      expect(decodedCrew.id, equals(filmCrewModel.id));
      expect(decodedCrew.name, equals(filmCrewModel.name));
      expect(decodedCrew.department, equals(filmCrewModel.department));
      expect(decodedCrew.job, equals(filmCrewModel.job));
    });

    test('should convert FilmCreditsModel to Map and back', () {
      // Convert to Map
      final map = filmCreditsModel.toMap();
      expect(map, isA<Map<String, dynamic>>());

      // Convert back from Map
      final decodedModel = FilmCreditsModelMapper.fromMap(map);
      expect(decodedModel, isA<FilmCreditsModel>());

      // Verify properties
      expect(decodedModel.id, equals(filmCreditsModel.id));
      expect(decodedModel.cast.length, equals(filmCreditsModel.cast.length));
      expect(decodedModel.crew.length, equals(filmCreditsModel.crew.length));

      // Verify nested FilmCastModel
      final decodedCast = decodedModel.cast.first;
      expect(decodedCast.id, equals(filmCastModel.id));
      expect(decodedCast.name, equals(filmCastModel.name));
      expect(decodedCast.character, equals(filmCastModel.character));

      // Verify nested FilmCrewModel
      final decodedCrew = decodedModel.crew.first;
      expect(decodedCrew.id, equals(filmCrewModel.id));
      expect(decodedCrew.name, equals(filmCrewModel.name));
      expect(decodedCrew.job, equals(filmCrewModel.job));
    });

    test('should handle JSON from API response', () {
      final jsonString = json.encode(creditsResultJson);
      final decodedModel = FilmCreditsModelMapper.fromJson(jsonString);

      expect(decodedModel.id, equals('574475'));
      expect(decodedModel.cast.length, equals(5));
      expect(decodedModel.crew.length, equals(3));

      final cast = decodedModel.cast.first;
      expect(cast.id, equals(3480304));
      expect(cast.name, equals("Kaitlyn Santa Juana"));

      final crew = decodedModel.crew.first;
      expect(crew.id, equals(1181022));
      expect(crew.name, equals("Zach Lipovsky"));
    });
  });
}
