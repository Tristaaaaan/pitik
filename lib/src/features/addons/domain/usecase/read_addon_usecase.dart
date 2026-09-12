import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/addon_entity.dart';
import '../repo/addon_repo.dart';

class ReadAddOn implements UseCase<List<AddOnEntity>, ReadPackagesParams> {
  final AddOnRepository _addOnRepository;

  ReadAddOn(this._addOnRepository);

  @override
  TaskEither<Failure, List<AddOnEntity>> call(ReadPackagesParams params) =>
      _addOnRepository.readAddOn(params);
}
