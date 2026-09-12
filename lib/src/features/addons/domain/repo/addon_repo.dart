import 'package:fpdart/fpdart.dart';
import 'package:pitik/src/core/error/failure.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';

abstract class AddOnRepository {
  TaskEither<Failure, Unit> createAddOn(AddOnEntity addOn);
  TaskEither<Failure, List<AddOnEntity>> readAddOn(ReadPackagesParams params);
  TaskEither<Failure, Unit> updateAddOn(AddOnEntity addOn);
  TaskEither<Failure, Unit> deleteAddOn(String packageId);
}
