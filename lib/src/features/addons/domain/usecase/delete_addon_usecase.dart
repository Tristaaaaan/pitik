import 'package:fpdart/fpdart.dart';
import 'package:pitik/src/core/error/failure.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/addons/domain/repo/addon_repo.dart';

class DeleteAddOn implements UseCase<Unit, String> {
  final AddOnRepository _addOnRepository;

  DeleteAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, Unit> call(String addOnId) =>
      _addOnRepository.deleteAddOn(addOnId);
}
