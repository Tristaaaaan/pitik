import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../entities/package_entity.dart';
import 'create_package_state.dart';

class CreatePackageCubit extends Cubit<CreatePackageState> {
  CreatePackageCubit() : super(const CreatePackageState());

  static const _uuid = Uuid();

  // --- Step 1: Basic Info ---
  void updateTitle(String value) => emit(state.copyWith(title: value));
  void updateBranding(String value) => emit(state.copyWith(branding: value));
  void updateDescription(String value) =>
      emit(state.copyWith(description: value));

  // --- Step 2: Inclusions ---
  void addInclusion() =>
      emit(state.copyWith(inclusions: [...state.inclusions, '']));

  void updateInclusion(int index, String value) {
    final updated = [...state.inclusions];
    if (index < 0 || index >= updated.length) return;
    updated[index] = value;
    emit(state.copyWith(inclusions: updated));
  }

  void removeInclusion(int index) {
    final updated = [...state.inclusions];
    if (index < 0 || index >= updated.length) return;
    updated.removeAt(index);
    emit(state.copyWith(inclusions: updated));
  }

  // --- Step 3: Price ---
  void updatePrice(double value) => emit(state.copyWith(price: value));

  // --- Step 4: Note & Availability ---
  void updateNote(String value) => emit(state.copyWith(note: value));
  void toggleAvailability(bool value) =>
      emit(state.copyWith(isAvailable: value));

  // --- Navigation ---
  void nextStep() {
    final steps = CreatePackageStep.values;
    final idx = state.step.index;
    if (idx < steps.length - 1) {
      emit(state.copyWith(step: steps[idx + 1]));
    }
  }

  void previousStep() {
    final steps = CreatePackageStep.values;
    final idx = state.step.index;
    if (idx > 0) {
      emit(state.copyWith(step: steps[idx - 1]));
    }
  }

  void goToStep(CreatePackageStep step) => emit(state.copyWith(step: step));

  // --- Build final model ---
  PackageEntity buildPackage() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return PackageEntity(
      id: _uuid.v4(),
      title: state.title.trim(),
      branding: state.branding.trim(),
      description: state.description.trim(),
      note: state.note.trim(),
      inclusion: state.inclusions
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      price: state.price,
      isAvailable: state.isAvailable,
      isDeleted: false,
      dateAdded: now,
      lastUpdated: now,
    );
  }
}
