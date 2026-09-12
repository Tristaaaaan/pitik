import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/presentation/cubit/create_addon_state.dart';
import 'package:uuid/uuid.dart';

class CreateAddOnCubit extends Cubit<CreateAddOnState> {
  CreateAddOnCubit() : super(const CreateAddOnState());
  static const _uuid = Uuid();

  void updateTitle(String value) => emit(state.copyWith(title: value));

  void updateDescription(String value) =>
      emit(state.copyWith(description: value));

  void updatePrice(String value) =>
      emit(state.copyWith(price: double.tryParse(value)));

  void updateUnit(String value) => emit(state.copyWith(unit: value));

  void nextStep() {
    final steps = CreateAddOnStep.values;
    final nextIndex = state.step.index + 1;
    if (nextIndex < steps.length) {
      emit(state.copyWith(step: steps[nextIndex]));
    }
  }

  void previousStep() {
    final prevIndex = state.step.index - 1;
    if (prevIndex >= 0) {
      emit(state.copyWith(step: CreateAddOnStep.values[prevIndex]));
    }
  }

  AddOnEntity buildAddOn() {
    final now = DateTime.now().millisecondsSinceEpoch;

    return AddOnEntity(
      id: _uuid.v4(),

      title: state.title.trim().isEmpty ? null : state.title.trim(),
      description: state.description.trim().isEmpty
          ? null
          : state.description.trim(),
      price: state.price,
      unit: state.unit.trim().isEmpty ? null : state.unit.trim(),
      dateAdded: now,
      lastUpdated: now,
      isAvailable: true,
      isDeleted: false,
    );
  }
}
