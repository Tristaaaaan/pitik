import 'package:pitik/src/core/error/fp.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/package/data/datasource/local/package_local_datasource.dart';
import 'package:pitik/src/features/package/data/models/package_model.dart';
import 'package:pitik/src/features/package/domain/repo/package_repo.dart';
import 'package:pitik/src/features/package/entities/package_entity.dart';

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
