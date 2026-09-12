import 'package:fpdart/fpdart.dart';
import 'package:pitik/src/core/error/failure.dart';
import 'package:pitik/src/core/usecase/usecase.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';

abstract class AddOnRepository {
  TaskEither<Failure, Unit> createAddOn(AddOnEntity addOn);
  TaskEither<Failure, List<AddOnEntity>> readPackage(ReadPackagesParams params);
  TaskEither<Failure, Unit> updatePackage(AddOnEntity addOn);
  TaskEither<Failure, Unit> deletePackage(String packageId);
}
