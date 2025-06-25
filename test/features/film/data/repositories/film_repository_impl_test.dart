import 'package:film_magic/core/errors/failures.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/film/data/datasources/film_local_data_source.dart';
import 'package:film_magic/features/film/data/datasources/film_remote_data_source.dart';
import 'package:film_magic/features/film/data/models/film_credits_model.dart';
import 'package:film_magic/features/film/data/models/film_detail_model.dart';
import 'package:film_magic/features/film/data/models/film_list_model.dart';
import 'package:film_magic/features/film/data/repositories/film_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'film_repository_impl_test.mocks.dart';

// Generate mocks for NetworkInfo, FilmLocalDataSource, and FilmRemoteDataSource
@GenerateMocks([NetworkInfo, FilmLocalDataSource, FilmRemoteDataSource])
void main() {
  late FilmRepositoryImpl repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockFilmLocalDataSource mockLocalDataSource;
  late MockFilmRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockFilmLocalDataSource();
    mockRemoteDataSource = MockFilmRemoteDataSource();
    repository = FilmRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  // Test data
  final testFilmListModel = FilmListModel(
    page: 1,
    totalPages: 10,
    totalResults: 100,
    results: [
      FilmModel(
        id: 1,
        title: 'Test Film',
        originalTitle: 'Test Film Original',
        overview: 'Test overview',
        posterPath: '/test_poster.jpg',
        backdropPath: '/test_backdrop.jpg',
        releaseDate: '2023-01-01',
        popularity: 100.0,
        voteAverage: 8.5,
        voteCount: 1000,
        adult: false,
        video: false,
        originalLanguage: 'en',
        genreIds: [1, 2, 3],
      ),
    ],
    dates: DateTimeRange(minimum: '2023-01-01', maximum: '2023-12-31'),
  );

  final testFilmDetailModel = FilmDetailModel(
    id: 1,
    title: 'Test Film',
    originalTitle: 'Test Film Original',
    overview: 'Test overview',
    posterPath: '/test_poster.jpg',
    backdropPath: '/test_backdrop.jpg',
    releaseDate: '2023-01-01',
    popularity: 100.0,
    voteAverage: 8.5,
    voteCount: 1000,
    adult: false,
    video: false,
    originalLanguage: 'en',
    genres: [],
    budget: 1000000,
    homepage: 'https://test.com',
    imdbId: 'tt1234567',
    productionCompanies: [],
    productionCountries: [],
    revenue: 5000000,
    runtime: 120,
    spokenLanguages: [],
    status: 'Released',
    tagline: 'Test tagline',
    belongsToCollection: null,
    originCountry: [],
  );

  final testFilmCreditsModel = FilmCreditsModel(id: '1', cast: [], crew: []);

  group('getNowPlayingFilms', () {
    test('should check if device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockRemoteDataSource.getNowPlayingFilms(),
      ).thenAnswer((_) async => testFilmListModel);
      when(
        mockLocalDataSource.cacheFilmList(any, any),
      ).thenAnswer((_) async {});

      // Act
      await repository.getNowPlayingFilms();

      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getNowPlayingFilms(),
          ).thenAnswer((_) async => testFilmListModel);
          when(
            mockLocalDataSource.cacheFilmList(any, any),
          ).thenAnswer((_) async {});

          // Act
          final result = await repository.getNowPlayingFilms();

          // Assert
          verify(mockRemoteDataSource.getNowPlayingFilms());
          expect(result, equals(testFilmListModel));
        },
      );

      test(
        'should cache the data locally when the call to remote is successful',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getNowPlayingFilms(),
          ).thenAnswer((_) async => testFilmListModel);
          when(
            mockLocalDataSource.cacheFilmList(any, any),
          ).thenAnswer((_) async {});

          // Act
          await repository.getNowPlayingFilms();

          // Assert
          verify(mockRemoteDataSource.getNowPlayingFilms());
          verify(
            mockLocalDataSource.cacheFilmList('now_playing', testFilmListModel),
          );
        },
      );

      test(
        'should return cached data when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getNowPlayingFilms(),
          ).thenThrow(ServerFailure(message: 'Server error'));
          when(
            mockLocalDataSource.getFilmList('now_playing'),
          ).thenAnswer((_) async => testFilmListModel);

          // Act
          final result = await repository.getNowPlayingFilms();

          // Assert
          verify(mockRemoteDataSource.getNowPlayingFilms());
          verify(mockLocalDataSource.getFilmList('now_playing'));
          expect(result, equals(testFilmListModel));
        },
      );

      test(
        'should throw ServerFailure when both remote and local data sources fail',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getNowPlayingFilms(),
          ).thenThrow(ServerFailure(message: 'Server error'));
          when(
            mockLocalDataSource.getFilmList('now_playing'),
          ).thenAnswer((_) async => null);

          // Act
          final call = repository.getNowPlayingFilms;

          // Assert
          await expectLater(call(), throwsA(isA<ServerFailure>()));
          verify(mockRemoteDataSource.getNowPlayingFilms());
          verify(mockLocalDataSource.getFilmList('now_playing'));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return locally cached data when available', () async {
        // Arrange
        when(
          mockLocalDataSource.getFilmList('now_playing'),
        ).thenAnswer((_) async => testFilmListModel);

        // Act
        final result = await repository.getNowPlayingFilms();

        // Assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getFilmList('now_playing'));
        expect(result, equals(testFilmListModel));
      });

      test(
        'should throw NetworkFailure when no cached data is available',
        () async {
          // Arrange
          when(
            mockLocalDataSource.getFilmList('now_playing'),
          ).thenAnswer((_) async => null);

          // Act
          final call = repository.getNowPlayingFilms;

          // Assert
          await expectLater(call(), throwsA(isA<NetworkFailure>()));
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getFilmList('now_playing'));
        },
      );
    });
  });

  group('getPopularFilms', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getPopularFilms(),
        ).thenAnswer((_) async => testFilmListModel);
        when(
          mockLocalDataSource.cacheFilmList(any, any),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.getPopularFilms();

        // Assert
        verify(mockRemoteDataSource.getPopularFilms());
        verify(mockLocalDataSource.cacheFilmList('popular', testFilmListModel));
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should return cached data when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getPopularFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('popular'),
        ).thenAnswer((_) async => testFilmListModel);

        // Act
        final result = await repository.getPopularFilms();

        // Assert
        verify(mockRemoteDataSource.getPopularFilms());
        verify(mockLocalDataSource.getFilmList('popular'));
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should throw ServerFailure when both remote and local data sources fail',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getPopularFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('popular'),
        ).thenAnswer((_) async => null);

        // Act
        final call = repository.getPopularFilms;

        // Assert
        await expectLater(call(), throwsA(isA<ServerFailure>()));
        verify(mockRemoteDataSource.getPopularFilms());
        verify(mockLocalDataSource.getFilmList('popular'));
      },
    );
  });

  group('getTopRatedFilms', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getTopRatedFilms(),
        ).thenAnswer((_) async => testFilmListModel);
        when(
          mockLocalDataSource.cacheFilmList(any, any),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.getTopRatedFilms();

        // Assert
        verify(mockRemoteDataSource.getTopRatedFilms());
        verify(
          mockLocalDataSource.cacheFilmList('top_rated', testFilmListModel),
        );
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should return cached data when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getTopRatedFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('top_rated'),
        ).thenAnswer((_) async => testFilmListModel);

        // Act
        final result = await repository.getTopRatedFilms();

        // Assert
        verify(mockRemoteDataSource.getTopRatedFilms());
        verify(mockLocalDataSource.getFilmList('top_rated'));
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should throw ServerFailure when both remote and local data sources fail',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getTopRatedFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('top_rated'),
        ).thenAnswer((_) async => null);

        // Act
        final call = repository.getTopRatedFilms;

        // Assert
        await expectLater(call(), throwsA(isA<ServerFailure>()));
        verify(mockRemoteDataSource.getTopRatedFilms());
        verify(mockLocalDataSource.getFilmList('top_rated'));
      },
    );
  });

  group('getUpcomingFilms', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getUpcomingFilms(),
        ).thenAnswer((_) async => testFilmListModel);
        when(
          mockLocalDataSource.cacheFilmList(any, any),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.getUpcomingFilms();

        // Assert
        verify(mockRemoteDataSource.getUpcomingFilms());
        verify(
          mockLocalDataSource.cacheFilmList('upcoming', testFilmListModel),
        );
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should return cached data when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getUpcomingFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('upcoming'),
        ).thenAnswer((_) async => testFilmListModel);

        // Act
        final result = await repository.getUpcomingFilms();

        // Assert
        verify(mockRemoteDataSource.getUpcomingFilms());
        verify(mockLocalDataSource.getFilmList('upcoming'));
        expect(result, equals(testFilmListModel));
      },
    );

    test(
      'should throw ServerFailure when both remote and local data sources fail',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getUpcomingFilms(),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmList('upcoming'),
        ).thenAnswer((_) async => null);

        // Act
        final call = repository.getUpcomingFilms;

        // Assert
        await expectLater(call(), throwsA(isA<ServerFailure>()));
        verify(mockRemoteDataSource.getUpcomingFilms());
        verify(mockLocalDataSource.getFilmList('upcoming'));
      },
    );
  });

  group('getFilmDetails', () {
    const testFilmId = 1;

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmDetails(testFilmId),
        ).thenAnswer((_) async => testFilmDetailModel);

        // Act
        final result = await repository.getFilmDetails(testFilmId);

        // Assert
        verify(mockRemoteDataSource.getFilmDetails(testFilmId));
        expect(result, equals(testFilmDetailModel));
      },
    );

    test(
      'should return cached data when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmDetails(testFilmId),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmDetails(testFilmId),
        ).thenAnswer((_) async => testFilmDetailModel);

        // Act
        final result = await repository.getFilmDetails(testFilmId);

        // Assert
        verify(mockRemoteDataSource.getFilmDetails(testFilmId));
        verify(mockLocalDataSource.getFilmDetails(testFilmId));
        expect(result, equals(testFilmDetailModel));
      },
    );

    test(
      'should throw ServerFailure when both remote and local data sources fail',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmDetails(testFilmId),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmDetails(testFilmId),
        ).thenAnswer((_) async => null);

        // Act
        final call = () => repository.getFilmDetails(testFilmId);

        // Assert
        await expectLater(call(), throwsA(isA<ServerFailure>()));
        verify(mockRemoteDataSource.getFilmDetails(testFilmId));
        verify(mockLocalDataSource.getFilmDetails(testFilmId));
      },
    );
  });

  group('getFilmCredits', () {
    const testFilmId = 1;

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmCredits(testFilmId),
        ).thenAnswer((_) async => testFilmCreditsModel);

        // Act
        final result = await repository.getFilmCredits(testFilmId);

        // Assert
        verify(mockRemoteDataSource.getFilmCredits(testFilmId));
        expect(result, equals(testFilmCreditsModel));
      },
    );

    test(
      'should return cached data when the call to remote data source is unsuccessful',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmCredits(testFilmId),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmCredits(testFilmId),
        ).thenAnswer((_) async => testFilmCreditsModel);

        // Act
        final result = await repository.getFilmCredits(testFilmId);

        // Assert
        verify(mockRemoteDataSource.getFilmCredits(testFilmId));
        verify(mockLocalDataSource.getFilmCredits(testFilmId));
        expect(result, equals(testFilmCreditsModel));
      },
    );

    test(
      'should throw ServerFailure when both remote and local data sources fail',
      () async {
        // Arrange
        when(
          mockRemoteDataSource.getFilmCredits(testFilmId),
        ).thenThrow(ServerFailure(message: 'Server error'));
        when(
          mockLocalDataSource.getFilmCredits(testFilmId),
        ).thenAnswer((_) async => null);

        // Act
        call() => repository.getFilmCredits(testFilmId);

        // Assert
        await expectLater(call(), throwsA(isA<ServerFailure>()));
        verify(mockRemoteDataSource.getFilmCredits(testFilmId));
        verify(mockLocalDataSource.getFilmCredits(testFilmId));
      },
    );
  });
}
