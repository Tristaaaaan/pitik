import '../../../../core/error/fp.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/repo/package_repo.dart';
import '../../entities/package_entity.dart';
import '../datasource/local/package_local_datasource.dart';
import '../models/package_model.dart';

class PackageRepoImpl implements PackageRepository {
  final PackageLocalDatasourceImpl packageLocalDatasource;

  PackageRepoImpl({required this.packageLocalDatasource});

  @override
  TaskEither<Failure, Unit> createPackage(PackageEntity package) {
    return TaskEither.tryCatch(() async {
      await packageLocalDatasource.createPackage(
        PackageModel.fromEntity(package),
      );
      return unit;
    }, (e, _) => CacheFailure(e.toString()));
  }

  @override
  TaskEither<Failure, List<PackageEntity>> readPackage(
    ReadPackagesParams params,
  ) {
    return TaskEither.tryCatch(() async {
      final result = await packageLocalDatasource.readPackages(
        params.offset,
        params.searchQuery,
      );
      return result.map((e) => e.toEntity()).toList();
    }, (e, _) => CacheFailure(e.toString()));
  }
}
