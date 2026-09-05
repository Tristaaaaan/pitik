/// Functional programming types and utilities (fpdart + app failures).
///
/// Use [Either]<[Failure], T> for operations that can fail.
/// Use [TaskEither]<[Failure], T> for async operations that can fail.
library;

export 'package:fpdart/fpdart.dart' show Either, TaskEither, Unit, unit;

export 'failure.dart';
