import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/package_entity.dart';

abstract class PackageRepository {
  TaskEither<Failure, Unit> createPackage(PackageEntity package);
  TaskEither<Failure, List<PackageEntity>> readPackage(
    ReadPackagesParams params,
  );
}
