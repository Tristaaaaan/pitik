import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repo/addon_repo.dart';

class DeleteAddOn implements UseCase<Unit, String> {
  final AddOnRepository _addOnRepository;

  DeleteAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, Unit> call(String addOnId) =>
      _addOnRepository.deleteAddOn(addOnId);
}
