// add_on_selection_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_selection_state.dart';

class AddOnSelectionCubit extends Cubit<AddOnSelectionState> {
  AddOnSelectionCubit() : super(const AddOnSelectionState());

  void setValue(AddOnEntity addOn, int value) {
    final updated = Map<AddOnEntity, int>.from(state.values);
    if (value <= 0) {
      updated.remove(addOn);
    } else {
      updated[addOn] = value;
    }
    emit(state.copyWith(values: updated));
  }

  void increment(AddOnEntity addOn) {
    final step = (addOn.price ?? 0).round();
    final current = state.valueFor(addOn);
    setValue(addOn, current + (step <= 0 ? 1 : step));
  }

  void decrement(AddOnEntity addOn) {
    final step = (addOn.price ?? 0).round();
    final current = state.valueFor(addOn);
    final next = current - (step <= 0 ? 1 : step);
    setValue(addOn, next < 0 ? 0 : next);
  }
}
