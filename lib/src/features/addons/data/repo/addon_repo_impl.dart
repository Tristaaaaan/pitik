import 'package:pitik/src/features/addons/data/datasource/local/addon_local_datasource.dart';
import 'package:pitik/src/features/addons/data/model/addon_model.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/domain/repo/addon_repo.dart';

import '../../../../core/error/fp.dart';
import '../../../../core/usecase/usecase.dart';

class AddOnRepoImpl implements AddOnRepository {
  final AddOnLocalDatasourceImpl addOnLocalDatasource;

  AddOnRepoImpl({required this.addOnLocalDatasource});

  @override
  TaskEither<Failure, Unit> createAddOn(AddOnEntity addOn) {
    return TaskEither.tryCatch(() async {
      await addOnLocalDatasource.createAddOn(AddOnModel.fromEntity(addOn));
      return unit;
    }, (e, _) => CacheFailure(e.toString()));
  }

  @override
  TaskEither<Failure, List<AddOnEntity>> readAddOn(ReadPackagesParams params) {
    return TaskEither.tryCatch(() async {
      final result = await addOnLocalDatasource.readAddOns(
        params.offset,
        params.searchQuery,
      );
      return result.map((e) => e.toEntity()).toList();
    }, (e, _) => CacheFailure(e.toString()));
  }

  @override
  TaskEither<Failure, Unit> updateAddOn(AddOnEntity addOn) {
    return TaskEither.tryCatch(() async {
      await addOnLocalDatasource.updateAddOn(AddOnModel.fromEntity(addOn));
      return unit;
    }, (e, _) => CacheFailure(e.toString()));
  }

  @override
  TaskEither<Failure, Unit> deleteAddOn(String addOnId) {
    return TaskEither.tryCatch(() async {
      await addOnLocalDatasource.deleteAddOn(addOnId);
      return unit;
    }, (e, _) => CacheFailure(e.toString()));
  }
}
