import 'package:equatable/equatable.dart';

import '../../../entities/package_entity.dart';

class PackageSelectionState extends Equatable {
  final List<PackageEntity> selectedPackages;

  const PackageSelectionState({this.selectedPackages = const []});

  bool isSelected(PackageEntity package) => selectedPackages.contains(package);

  PackageSelectionState copyWith({List<PackageEntity>? selectedPackages}) {
    return PackageSelectionState(
      selectedPackages: selectedPackages ?? this.selectedPackages,
    );
  }

  @override
  List<Object?> get props => [selectedPackages];
}
