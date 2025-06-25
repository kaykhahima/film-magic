/// Base class for all failures in the application.
/// All specific failure types should extend this class.
abstract class Failure {
  final String message;

  const Failure({required this.message});

  @override
  String toString() => 'Failure: $message';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

/// Failure related to server errors (e.g., API errors, backend issues).
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// Failure related to network connectivity issues.
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network connection issue'});
}

/// Failure related to local cache operations.
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache operation failed'});
}
