import '../../../../core/error/fp.dart';
import '../../../../core/usecase/usecase.dart';
import '../../entities/package_entity.dart';
import '../repo/package_repo.dart';

class ReadPackage implements UseCase<List<PackageEntity>, ReadPackagesParams> {
  final PackageRepository _packageRepository;

  ReadPackage(this._packageRepository);

  @override
  TaskEither<Failure, List<PackageEntity>> call(ReadPackagesParams params) =>
      _packageRepository.readPackage(params);
}
