import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/addon_entity.dart';
import '../repo/addon_repo.dart';

class CreateAddOn implements UseCase<Unit, AddOnEntity> {
  final AddOnRepository _addOnRepository;

  CreateAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, Unit> call(AddOnEntity addOn) =>
      _addOnRepository.createAddOn(addOn);
}
