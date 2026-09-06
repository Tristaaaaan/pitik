import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/package_entity.dart';
import 'package_selection_state.dart';

class PackageSelectionCubit extends Cubit<PackageSelectionState> {
  PackageSelectionCubit() : super(const PackageSelectionState());

  void toggleSelection(PackageEntity package) {
    final current = List<PackageEntity>.from(state.selectedPackages);

    if (current.contains(package)) {
      current.remove(package);
    } else {
      current.add(package);
    }

    emit(state.copyWith(selectedPackages: current));
  }

  void clearSelection() {
    emit(state.copyWith(selectedPackages: []));
  }

  bool isSelected(PackageEntity package) =>
      state.selectedPackages.contains(package);
}
