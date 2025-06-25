import 'package:film_magic/core/errors/failures.dart';
import 'package:film_magic/core/network/network_info.dart';
import 'package:film_magic/features/actor/data/datasources/actor_local_data_source.dart';
import 'package:film_magic/features/actor/data/datasources/actor_remote_data_source.dart';
import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';
import 'package:film_magic/features/actor/data/repositories/actor_repository.dart';

class ActorRepositoryImpl implements ActorRepository {
  final NetworkInfo _networkInfo;
  final ActorLocalDataSource _localDataSource;
  final ActorRemoteDataSource _remoteDataSource;

  ActorRepositoryImpl({
    required NetworkInfo networkInfo,
    required ActorLocalDataSource localDataSource,
    required ActorRemoteDataSource remoteDataSource,
  }) : _networkInfo = networkInfo,
       _localDataSource = localDataSource,
       _remoteDataSource = remoteDataSource;

  /// Checks if the device is connected to the internet
  /// Returns true if connected, false otherwise
  Future<bool> _isConnected() async {
    return await _networkInfo.isConnected;
  }

  @override
  Future<ActorDetailModel> getActorDetails(int actorId) async {
    try {
      // Check if we're online
      final isConnected = await _isConnected();

      // If we're online, try to fetch from remote data source first
      if (isConnected) {
        try {
          final actorDetails = await _remoteDataSource.getActorDetails(actorId);

          // Cache the results
          await _localDataSource.cacheActorDetails(actorDetails);

          return actorDetails;
        } catch (e) {
          // If remote data source fails, try to get from local data source
          final cachedData = await _localDataSource.getActorDetails(actorId);
          if (cachedData != null) {
            return cachedData;
          }

          // If no cache, rethrow the original error
          rethrow;
        }
      } else {
        // We're offline, try to get from local data source
        final cachedData = await _localDataSource.getActorDetails(actorId);
        if (cachedData != null) {
          return cachedData;
        }

        // If no cache, throw network failure
        throw NetworkFailure(
          message: 'No internet connection and no cached data available',
        );
      }
    } catch (e) {
      if (e is NetworkFailure || e is ServerFailure) {
        rethrow;
      }
      throw ServerFailure(message: e.toString());
    }
  }
}
