import 'package:fpdart/fpdart.dart';
import 'package:pitik/src/core/error/failure.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/domain/repo/addon_repo.dart';

class ReadAddOn implements UseCase<List<AddOnEntity>, ReadPackagesParams> {
  final AddOnRepository _addOnRepository;

  ReadAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, List<AddOnEntity>> call(ReadPackagesParams params) =>
      _addOnRepository.readAddOn(params);
}
