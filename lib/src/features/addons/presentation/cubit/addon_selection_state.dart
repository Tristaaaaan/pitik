// add_on_selection_state.dart
import 'package:equatable/equatable.dart';
import 'package:pitik/src/features/addons/domain/entity/addon_entity.dart';

class AddOnSelectionState extends Equatable {
  final Map<AddOnEntity, int> values;

  const AddOnSelectionState({this.values = const {}});

  int valueFor(AddOnEntity addOn) => values[addOn] ?? 0;

  bool isSelected(AddOnEntity addOn) => valueFor(addOn) > 0;

  List<MapEntry<AddOnEntity, int>> get selectedAddOns =>
      values.entries.where((e) => e.value > 0).toList();

  AddOnSelectionState copyWith({Map<AddOnEntity, int>? values}) {
    return AddOnSelectionState(values: values ?? this.values);
  }

  @override
  List<Object?> get props => [values];
}
