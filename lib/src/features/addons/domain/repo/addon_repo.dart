import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/addon_entity.dart';

abstract class AddOnRepository {
  TaskEither<Failure, Unit> createAddOn(AddOnEntity addOn);
  TaskEither<Failure, List<AddOnEntity>> readAddOn(ReadPackagesParams params);
  TaskEither<Failure, Unit> updateAddOn(AddOnEntity addOn);
  TaskEither<Failure, Unit> deleteAddOn(String packageId);
}
