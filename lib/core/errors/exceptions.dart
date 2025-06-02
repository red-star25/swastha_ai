// exceptions.dart
class ServerException implements Exception {}

class CacheException implements Exception {}

abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}
