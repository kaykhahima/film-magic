import 'dart:convert';

import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilmDetailModel', () {
    final filmCollection = FilmCollection(
      id: 123,
      name: 'Collection Name',
      posterPath: '/path/to/poster.jpg',
      backdropPath: '/path/to/backdrop.jpg',
    );

    final filmGenre = FilmGenre(id: 28, name: 'Action');

    final productionCompany = ProductionCompany(
      id: 456,
      logoPath: '/path/to/logo.png',
      name: 'Production Company',
      originCountry: 'US',
    );

    final productionCountry = ProductionCountry(
      iso31661: 'US',
      name: 'United States',
    );

    final spokenLanguage = SpokenLanguage(
      englishName: 'English',
      iso6391: 'en',
      name: 'English',
    );

    final filmDetailModel = FilmDetailModel(
      adult: false,
      backdropPath: '/path/to/backdrop.jpg',
      belongsToCollection: filmCollection,
      budget: 200000000,
      genres: [filmGenre],
      homepage: 'https://example.com',
      id: 123,
      imdbId: 'tt1234567',
      originCountry: ['US'],
      originalLanguage: 'en',
      originalTitle: 'Original Title',
      overview: 'Movie overview text',
      popularity: 8.5,
      posterPath: '/path/to/poster.jpg',
      productionCompanies: [productionCompany],
      productionCountries: [productionCountry],
      releaseDate: '2023-05-15',
      revenue: 500000000,
      runtime: 120,
      spokenLanguages: [spokenLanguage],
      status: 'Released',
      tagline: 'Movie tagline',
      title: 'Movie Title',
      video: false,
      voteAverage: 7.8,
      voteCount: 1500,
    );

    test('should convert FilmDetailModel to JSON and back', () {
      // Convert to JSON
      final jsonString = filmDetailModel.toJson();
      expect(jsonString, isA<String>());

      // Convert back from JSON
      final decodedModel = FilmDetailModelMapper.fromJson(jsonString);
      expect(decodedModel, isA<FilmDetailModel>());
      
      // Verify properties
      expect(decodedModel.id, equals(filmDetailModel.id));
      expect(decodedModel.title, equals(filmDetailModel.title));
      expect(decodedModel.overview, equals(filmDetailModel.overview));
      expect(decodedModel.budget, equals(filmDetailModel.budget));
      expect(decodedModel.revenue, equals(filmDetailModel.revenue));
      expect(decodedModel.runtime, equals(filmDetailModel.runtime));
      
      // Verify nested objects
      expect(decodedModel.belongsToCollection?.id, equals(filmCollection.id));
      expect(decodedModel.belongsToCollection?.name, equals(filmCollection.name));
      
      expect(decodedModel.genres.length, equals(1));
      expect(decodedModel.genres.first.id, equals(filmGenre.id));
      expect(decodedModel.genres.first.name, equals(filmGenre.name));
      
      expect(decodedModel.productionCompanies.length, equals(1));
      expect(decodedModel.productionCompanies.first.id, equals(productionCompany.id));
      expect(decodedModel.productionCompanies.first.name, equals(productionCompany.name));
      
      expect(decodedModel.spokenLanguages.length, equals(1));
      expect(decodedModel.spokenLanguages.first.iso6391, equals(spokenLanguage.iso6391));
    });

    test('should convert FilmDetailModel to Map and back', () {
      // Convert to Map
      final map = filmDetailModel.toMap();
      expect(map, isA<Map<String, dynamic>>());

      // Convert back from Map
      final decodedModel = FilmDetailModelMapper.fromMap(map);
      expect(decodedModel, isA<FilmDetailModel>());
      
      // Verify properties
      expect(decodedModel.id, equals(filmDetailModel.id));
      expect(decodedModel.title, equals(filmDetailModel.title));
      expect(decodedModel.overview, equals(filmDetailModel.overview));
      expect(decodedModel.budget, equals(filmDetailModel.budget));
      expect(decodedModel.revenue, equals(filmDetailModel.revenue));
      expect(decodedModel.runtime, equals(filmDetailModel.runtime));
      
      // Verify nested objects
      expect(decodedModel.belongsToCollection?.id, equals(filmCollection.id));
      expect(decodedModel.genres.first.id, equals(filmGenre.id));
      expect(decodedModel.productionCompanies.first.id, equals(productionCompany.id));
      expect(decodedModel.productionCountries.first.iso31661, equals(productionCountry.iso31661));
      expect(decodedModel.spokenLanguages.first.iso6391, equals(spokenLanguage.iso6391));
    });

    test('should handle JSON from API response', () {
      final jsonMap = {
        "adult": false,
        "backdrop_path": "/path/to/backdrop.jpg",
        "belongs_to_collection": {
          "id": 123,
          "name": "Collection Name",
          "poster_path": "/path/to/poster.jpg",
          "backdrop_path": "/path/to/backdrop.jpg"
        },
        "budget": 200000000,
        "genres": [
          {
            "id": 28,
            "name": "Action"
          }
        ],
        "homepage": "https://example.com",
        "id": 123,
        "imdb_id": "tt1234567",
        "origin_country": ["US"],
        "original_language": "en",
        "original_title": "Original Title",
        "overview": "Movie overview text",
        "popularity": 8.5,
        "poster_path": "/path/to/poster.jpg",
        "production_companies": [
          {
            "id": 456,
            "logo_path": "/path/to/logo.png",
            "name": "Production Company",
            "origin_country": "US"
          }
        ],
        "production_countries": [
          {
            "iso_3166_1": "US",
            "name": "United States"
          }
        ],
        "release_date": "2023-05-15",
        "revenue": 500000000,
        "runtime": 120,
        "spoken_languages": [
          {
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
          }
        ],
        "status": "Released",
        "tagline": "Movie tagline",
        "title": "Movie Title",
        "video": false,
        "vote_average": 7.8,
        "vote_count": 1500
      };

      final jsonString = json.encode(jsonMap);
      final decodedModel = FilmDetailModelMapper.fromJson(jsonString);
      
      expect(decodedModel.id, equals(123));
      expect(decodedModel.title, equals("Movie Title"));
      expect(decodedModel.budget, equals(200000000));
      expect(decodedModel.revenue, equals(500000000));
      expect(decodedModel.runtime, equals(120));
      
      expect(decodedModel.belongsToCollection?.id, equals(123));
      expect(decodedModel.belongsToCollection?.name, equals("Collection Name"));
      
      expect(decodedModel.genres.length, equals(1));
      expect(decodedModel.genres.first.id, equals(28));
      expect(decodedModel.genres.first.name, equals("Action"));
    });
  });
}