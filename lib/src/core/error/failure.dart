import 'package:equatable/equatable.dart';

/// Base type for domain/application failures (Left side of [Either]).
abstract class Failure extends Equatable {
  const Failure([this.message]);

  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Local / cache / DB errors.
class CacheFailure extends Failure {
  const CacheFailure([super.message]);
}

/// Remote / API / server errors.
class ServerFailure extends Failure {
  const ServerFailure([super.message]);
}

/// Validation / invalid input errors.
class ValidationFailure extends Failure {
  const ValidationFailure([super.message]);
}
