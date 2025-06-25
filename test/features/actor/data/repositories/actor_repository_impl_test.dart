import 'package:film_magic/core/errors/failures.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/actor/data/datasources/actor_local_data_source.dart';
import 'package:film_magic/features/actor/data/datasources/actor_remote_data_source.dart';
import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';
import 'package:film_magic/features/actor/data/repositories/actor_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'actor_repository_impl_test.mocks.dart';

// Generate mocks for NetworkInfo, ActorLocalDataSource, and ActorRemoteDataSource
@GenerateMocks([NetworkInfo, ActorLocalDataSource, ActorRemoteDataSource])
void main() {
  late ActorRepositoryImpl repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockActorLocalDataSource mockLocalDataSource;
  late MockActorRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockLocalDataSource = MockActorLocalDataSource();
    mockRemoteDataSource = MockActorRemoteDataSource();
    repository = ActorRepositoryImpl(
      networkInfo: mockNetworkInfo,
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  // Test data
  final testActorDetailModel = ActorDetailModel(
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

  group('getActorDetails', () {
    const testActorId = 1245;

    test('should check if device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(
        mockRemoteDataSource.getActorDetails(testActorId),
      ).thenAnswer((_) async => testActorDetailModel);
      when(
        mockLocalDataSource.cacheActorDetails(any),
      ).thenAnswer((_) async {});

      // Act
      await repository.getActorDetails(testActorId);

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
            mockRemoteDataSource.getActorDetails(testActorId),
          ).thenAnswer((_) async => testActorDetailModel);
          when(
            mockLocalDataSource.cacheActorDetails(any),
          ).thenAnswer((_) async {});

          // Act
          final result = await repository.getActorDetails(testActorId);

          // Assert
          verify(mockRemoteDataSource.getActorDetails(testActorId));
          expect(result, equals(testActorDetailModel));
        },
      );

      test(
        'should cache the data locally when the call to remote is successful',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getActorDetails(testActorId),
          ).thenAnswer((_) async => testActorDetailModel);
          when(
            mockLocalDataSource.cacheActorDetails(any),
          ).thenAnswer((_) async {});

          // Act
          await repository.getActorDetails(testActorId);

          // Assert
          verify(mockRemoteDataSource.getActorDetails(testActorId));
          verify(
            mockLocalDataSource.cacheActorDetails(testActorDetailModel),
          );
        },
      );

      test(
        'should return cached data when the call to remote data source is unsuccessful',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getActorDetails(testActorId),
          ).thenThrow(ServerFailure(message: 'Server error'));
          when(
            mockLocalDataSource.getActorDetails(testActorId),
          ).thenAnswer((_) async => testActorDetailModel);

          // Act
          final result = await repository.getActorDetails(testActorId);

          // Assert
          verify(mockRemoteDataSource.getActorDetails(testActorId));
          verify(mockLocalDataSource.getActorDetails(testActorId));
          expect(result, equals(testActorDetailModel));
        },
      );

      test(
        'should throw ServerFailure when both remote and local data sources fail',
        () async {
          // Arrange
          when(
            mockRemoteDataSource.getActorDetails(testActorId),
          ).thenThrow(ServerFailure(message: 'Server error'));
          when(
            mockLocalDataSource.getActorDetails(testActorId),
          ).thenAnswer((_) async => null);

          // Act
          final call = repository.getActorDetails;

          // Assert
          await expectLater(call(testActorId), throwsA(isA<ServerFailure>()));
          verify(mockRemoteDataSource.getActorDetails(testActorId));
          verify(mockLocalDataSource.getActorDetails(testActorId));
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
          mockLocalDataSource.getActorDetails(testActorId),
        ).thenAnswer((_) async => testActorDetailModel);

        // Act
        final result = await repository.getActorDetails(testActorId);

        // Assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getActorDetails(testActorId));
        expect(result, equals(testActorDetailModel));
      });

      test(
        'should throw NetworkFailure when no cached data is available',
        () async {
          // Arrange
          when(
            mockLocalDataSource.getActorDetails(testActorId),
          ).thenAnswer((_) async => null);

          // Act
          final call = repository.getActorDetails;

          // Assert
          await expectLater(call(testActorId), throwsA(isA<NetworkFailure>()));
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getActorDetails(testActorId));
        },
      );
    });
  });
}