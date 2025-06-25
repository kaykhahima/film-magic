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
