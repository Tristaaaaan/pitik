import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repo/package_repo.dart';

class DeletePackage implements UseCase<Unit, String> {
  final PackageRepository _packageRepository;

  DeletePackage(this._packageRepository);

  @override
  TaskEither<Failure, Unit> call(String packageId) =>
      _packageRepository.deletePackage(packageId);
}
