import 'package:film_magic/core/constants/api_constants.dart';
import 'package:film_magic/core/network/api_client.dart';
import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';

class ActorRemoteDataSource {
  final ApiClient _apiClient;

  ActorRemoteDataSource(this._apiClient);

  Future<ActorDetailModel> getActorDetails(int actorId) async {
    final response = await _apiClient.get(
      '${ApiConstants.personEndpoint}$actorId',
      queryParameters: {
        ApiConstants.languageParam: ApiConstants.defaultLanguage,
      },
    );

    return ActorDetailModelMapper.fromMap(response);
  }
}
