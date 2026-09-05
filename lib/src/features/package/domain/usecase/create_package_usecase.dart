import '../../../../core/error/fp.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/package_entity.dart';
import '../repo/package_repo.dart';

class CreatePackage implements UseCase<Unit, PackageEntity> {
  final PackageRepository _packageRepository;

  CreatePackage(this._packageRepository);

  @override
  TaskEither<Failure, Unit> call(PackageEntity package) =>
      _packageRepository.createPackage(package);
}
