import 'package:fpdart/fpdart.dart';
import 'package:pitik/src/core/error/failure.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/domain/repo/addon_repo.dart';

class CreateAddOn implements UseCase<Unit, AddOnEntity> {
  final AddOnRepository _addOnRepository;

  CreateAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, Unit> call(AddOnEntity addOn) =>
      _addOnRepository.createAddOn(addOn);
}
