import 'dart:convert';

import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilmListModel', () {
    final testFilmListJson = {
      "dates": {"maximum": "2025-07-02", "minimum": "2025-05-21"},
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/uIpJPDNFoeX0TVml9smPrs9KUVx.jpg",
          "genre_ids": [27, 9648],
          "id": 574475,
          "original_language": "en",
          "original_title": "Final Destination Bloodlines",
          "overview":
              "Plagued by a violent recurring nightmare, college student Stefanie heads home to track down the one person who might be able to break the cycle and save her family from the grisly demise that inevitably awaits them all.",
          "popularity": 851.0718,
          "poster_path": "/6WxhEvFsauuACfv8HyoVX6mZKFj.jpg",
          "release_date": "2025-05-14",
          "title": "Final Destination Bloodlines",
          "video": false,
          "vote_average": 7.211,
          "vote_count": 1260,
        },
        {
          "adult": false,
          "backdrop_path": "/7Zx3wDG5bBtcfk8lcnCWDOLM4Y4.jpg",
          "genre_ids": [10751, 878, 35, 12],
          "id": 552524,
          "original_language": "en",
          "original_title": "Lilo & Stitch",
          "overview":
              "The wildly funny and touching story of a lonely Hawaiian girl and the fugitive alien who helps to mend her broken family.",
          "popularity": 418.9379,
          "poster_path": "/7c5VBuCbjZOk7lSfj9sMpmDIaKX.jpg",
          "release_date": "2025-05-17",
          "title": "Lilo & Stitch",
          "video": false,
          "vote_average": 7.105,
          "vote_count": 711,
        },
        {
          "adult": false,
          "backdrop_path": "/7HqLLVjdjhXS0Qoz1SgZofhkIpE.jpg",
          "genre_ids": [14, 10751, 28],
          "id": 1087192,
          "original_language": "en",
          "original_title": "How to Train Your Dragon",
          "overview":
              "On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.",
          "popularity": 351.4487,
          "poster_path": "/q5pXRYTycaeW6dEgsCrd4mYPmxM.jpg",
          "release_date": "2025-06-06",
          "title": "How to Train Your Dragon",
          "video": false,
          "vote_average": 7.924,
          "vote_count": 407,
        },
        {
          "adult": false,
          "backdrop_path": "/6WqqEjiycNvDLjbEClM1zCwIbDD.jpg",
          "genre_ids": [27, 53, 878],
          "id": 1100988,
          "original_language": "en",
          "original_title": "28 Years Later",
          "overview":
              "Twenty-eight years since the rage virus escaped a biological weapons laboratory, now, still in a ruthlessly enforced quarantine, some have found ways to exist amidst the infected. One such group lives on a small island connected to the mainland by a single, heavily-defended causeway. When one member departs on a mission into the dark heart of the mainland, he discovers secrets, wonders, and horrors that have mutated not only the infected but other survivors as well.",
          "popularity": 296.7897,
          "poster_path": "/361hRZoG91Nw6qXaIKuGoogQjix.jpg",
          "release_date": "2025-06-18",
          "title": "28 Years Later",
          "video": false,
          "vote_average": 7.1,
          "vote_count": 263,
        },
        {
          "adult": false,
          "backdrop_path": "/fPWJn5pqBr8n4h0YxW3QuasdvoI.jpg",
          "genre_ids": [28, 53],
          "id": 1127110,
          "original_language": "en",
          "original_title": "Diablo",
          "overview":
              "Ex-con Kris Chaney seizes the daughter of a Colombian gangster to fulfill a noble promise to the young girl's mother. When her father enlists both the criminal underworld and a psychotic killer to exact his revenge, Kris relies on everything he's ever learned to stay alive and keep his word.",
          "popularity": 261.3418,
          "poster_path": "/uFQduVyYIinJy3eLjozgfl6Xtcn.jpg",
          "release_date": "2025-06-13",
          "title": "Diablo",
          "video": false,
          "vote_average": 6.979,
          "vote_count": 48,
        },
        {
          "adult": false,
          "backdrop_path": "/wnnu8htEZBLtwrke9QYfLKx6zjp.jpg",
          "genre_ids": [53, 18, 80],
          "id": 1426776,
          "original_language": "en",
          "original_title": "STRAW",
          "overview":
              "What will be her last straw? A devastatingly bad day pushes a hardworking single mother to the breaking point — and into a shocking act of desperation.",
          "popularity": 229.3899,
          "poster_path": "/t3cmnXYtxJb9vVL1ThvT2CWSe1n.jpg",
          "release_date": "2025-06-05",
          "title": "STRAW",
          "video": false,
          "vote_average": 7.976,
          "vote_count": 622,
        },
        {
          "adult": false,
          "backdrop_path": "/l3ycQYwWmbz7p8otwbomFDXIEhn.jpg",
          "genre_ids": [16, 14, 28, 35, 10402],
          "id": 803796,
          "original_language": "en",
          "original_title": "KPop Demon Hunters",
          "overview":
              "When K-pop superstars Rumi, Mira and Zoey aren't selling out stadiums, they're using their secret powers to protect their fans from supernatural threats.",
          "popularity": 281.0059,
          "poster_path": "/22AouvwlhlXbe3nrFcjzL24bvWH.jpg",
          "release_date": "2025-06-20",
          "title": "KPop Demon Hunters",
          "video": false,
          "vote_average": 8.8,
          "vote_count": 150,
        },
        {
          "adult": false,
          "backdrop_path": "/a3F9cXjRH488qcOqFmFZwqawBMU.jpg",
          "genre_ids": [16, 28, 878],
          "id": 1376434,
          "original_language": "en",
          "original_title": "Predator: Killer of Killers",
          "overview":
              "While three of the fiercest warriors in human history—a Viking raider, a ninja in feudal Japan, and a WWII pilot—are killers in their own right, they are merely prey for their new opponent: the ultimate killer of killers.",
          "popularity": 167.2797,
          "poster_path": "/2XDQa6EmFHSA37j1t0w88vpWqj9.jpg",
          "release_date": "2025-06-05",
          "title": "Predator: Killer of Killers",
          "video": false,
          "vote_average": 7.997,
          "vote_count": 601,
        },
        {
          "adult": false,
          "backdrop_path": "/nAxGnGHOsfzufThz20zgmRwKur3.jpg",
          "genre_ids": [27, 14, 53],
          "id": 1233413,
          "original_language": "en",
          "original_title": "Sinners",
          "overview":
              "Trying to leave their troubled lives behind, twin brothers return to their hometown to start again, only to discover that an even greater evil is waiting to welcome them back.",
          "popularity": 165.9784,
          "poster_path": "/jYfMTSiFFK7ffbY2lay4zyvTkEk.jpg",
          "release_date": "2025-04-16",
          "title": "Sinners",
          "video": false,
          "vote_average": 7.6,
          "vote_count": 1638,
        },
        {
          "adult": false,
          "backdrop_path": "/lOje1iz4VYWELYWRkZAwI7oIJd0.jpg",
          "genre_ids": [28, 35, 80],
          "id": 1239193,
          "original_language": "en",
          "original_title": "Deep Cover",
          "overview":
              "Kat is an improv comedy teacher beginning to question if she’s missed her shot at success. When an undercover cop offers her the role of a lifetime, she recruits two of her students to infiltrate London’s gangland by impersonating dangerous criminals.",
          "popularity": 131.9182,
          "poster_path": "/euM8fJvfH28xhjGy25LiygxfkWc.jpg",
          "release_date": "2025-06-12",
          "title": "Deep Cover",
          "video": false,
          "vote_average": 6.742,
          "vote_count": 207,
        },
      ],
      "total_pages": 243,
      "total_results": 4856,
    };

    final filmModel = FilmModel(
      adult: false,
      backdropPath: '/path/to/backdrop.jpg',
      genreIds: [28, 12, 878],
      id: 123,
      originalLanguage: 'en',
      originalTitle: 'Original Title',
      overview: 'Movie overview text',
      popularity: 8.5,
      posterPath: '/path/to/poster.jpg',
      releaseDate: '2023-05-15',
      title: 'Movie Title',
      video: false,
      voteAverage: 7.8,
      voteCount: 1500,
    );

    final dateTimeRange = DateTimeRange(
      maximum: '2023-06-30',
      minimum: '2023-05-01',
    );

    final filmListModel = FilmListModel(
      dates: dateTimeRange,
      results: [filmModel],
      page: 1,
      totalPages: 10,
      totalResults: 200,
    );

    test('should convert FilmListModel to JSON and back', () {
      // Convert to JSON
      final jsonString = filmListModel.toJson();
      expect(jsonString, isA<String>());

      // Convert back from JSON
      final decodedModel = FilmListModelMapper.fromJson(jsonString);
      expect(decodedModel, isA<FilmListModel>());

      // Verify properties
      expect(decodedModel.page, equals(filmListModel.page));
      expect(decodedModel.totalPages, equals(filmListModel.totalPages));
      expect(decodedModel.totalResults, equals(filmListModel.totalResults));
      expect(decodedModel.results.length, equals(filmListModel.results.length));

      // Verify nested DateTimeRange
      expect(decodedModel.dates?.maximum, equals(dateTimeRange.maximum));
      expect(decodedModel.dates?.minimum, equals(dateTimeRange.minimum));

      // Verify nested FilmModel
      final decodedFilm = decodedModel.results.first;
      expect(decodedFilm.id, equals(filmModel.id));
      expect(decodedFilm.title, equals(filmModel.title));
      expect(decodedFilm.overview, equals(filmModel.overview));
      expect(decodedFilm.posterPath, equals(filmModel.posterPath));
    });

    test('should convert FilmListModel to Map and back', () {
      // Convert to Map
      final map = filmListModel.toMap();
      expect(map, isA<Map<String, dynamic>>());

      // Convert back from Map
      final decodedModel = FilmListModelMapper.fromMap(map);
      expect(decodedModel, isA<FilmListModel>());

      // Verify properties
      expect(decodedModel.page, equals(filmListModel.page));
      expect(decodedModel.totalPages, equals(filmListModel.totalPages));
      expect(decodedModel.totalResults, equals(filmListModel.totalResults));
      expect(decodedModel.results.length, equals(filmListModel.results.length));

      // Verify nested DateTimeRange
      expect(decodedModel.dates?.maximum, equals(dateTimeRange.maximum));
      expect(decodedModel.dates?.minimum, equals(dateTimeRange.minimum));

      // Verify nested FilmModel
      final decodedFilm = decodedModel.results.first;
      expect(decodedFilm.id, equals(filmModel.id));
      expect(decodedFilm.title, equals(filmModel.title));
      expect(decodedFilm.overview, equals(filmModel.overview));
      expect(decodedFilm.posterPath, equals(filmModel.posterPath));
    });

    test('should handle JSON from API response', () {
      final jsonString = json.encode(testFilmListJson);
      final decodedModel = FilmListModelMapper.fromJson(jsonString);

      expect(decodedModel.page, equals(1));
      expect(decodedModel.totalPages, equals(243));
      expect(decodedModel.totalResults, equals(4856));
      expect(decodedModel.results.length, equals(10));

      final film = decodedModel.results.first;
      expect(film.id, equals(574475));
      expect(film.title, equals("Final Destination Bloodlines"));
    });
  });
}
