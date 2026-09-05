import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_package_state.freezed.dart';

enum CreatePackageStep { basicInfo, inclusion, price, note }

extension CreatePackageStepX on CreatePackageStep {
  int get index => CreatePackageStep.values.indexOf(this);

  String get label {
    switch (this) {
      case CreatePackageStep.basicInfo:
        return 'Basic Info';
      case CreatePackageStep.inclusion:
        return 'Inclusions';
      case CreatePackageStep.price:
        return 'Price';
      case CreatePackageStep.note:
        return 'Notes';
    }
  }
}

@freezed
abstract class CreatePackageState with _$CreatePackageState {
  const CreatePackageState._();

  const factory CreatePackageState({
    @Default(CreatePackageStep.basicInfo) CreatePackageStep step,
    @Default('') String title,
    @Default('') String branding,
    @Default('') String description,
    @Default(<String>[]) List<String> inclusions,
    @Default(0.0) double price,
    @Default('') String note,
    @Default(true) bool isAvailable,
    @Default(false) bool isSubmitting,
  }) = _CreatePackageState;

  bool get isFirstStep => step == CreatePackageStep.basicInfo;
  bool get isLastStep => step == CreatePackageStep.note;
}
