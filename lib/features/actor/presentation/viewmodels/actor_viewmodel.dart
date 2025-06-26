import 'package:flutter/material.dart';
import 'package:film_magic/features/actor/data/models/actor_detail_model.dart';
import 'package:film_magic/features/actor/data/repositories/actor_repository.dart';

class ActorViewModel extends ChangeNotifier {
  final ActorRepository _actorRepository;

  ActorViewModel(this._actorRepository);

  // State variables
  bool _isLoading = false;
  String? _errorMessage;

  // Actor details
  ActorDetailModel? _actorDetails;

  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ActorDetailModel? get actorDetails => _actorDetails;

  ActorDetailModel? get dummyActorDetails => ActorDetailModel(
    adult: false,
    alsoKnownAs: ["Scarlett Ingrid Johansson"],
    biography:
        "Scarlett Ingrid Johansson (born November 22, 1984) is an American actress. The world's highest-paid actress in 2018 and 2019, she has featured multiple times on the Forbes Celebrity 100 list.",
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

  // Load actor details
  Future<void> loadActorDetails(int actorId) async {
    _setLoading(true);
    _clearError();

    try {
      _actorDetails = await _actorRepository.getActorDetails(actorId);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    // notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    // notifyListeners();
  }
}
