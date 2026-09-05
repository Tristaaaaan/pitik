import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

abstract class UseCase<T, Params> {
  TaskEither<Failure, T> call(Params params);
}

class ReadPackagesParams extends Equatable {
  final int offset;
  final String? searchQuery;

  const ReadPackagesParams({required this.offset, this.searchQuery});

  @override
  List<Object?> get props => [offset, searchQuery];
}
