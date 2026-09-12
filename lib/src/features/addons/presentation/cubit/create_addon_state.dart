enum CreateAddOnStep {
  basicInfo('Basic Info'),
  price('Price'),
  unit('Unit');

  const CreateAddOnStep(this.label);
  final String label;
}

class CreateAddOnState {
  final CreateAddOnStep step;
  final String title;
  final String description;
  final double? price;
  final String unit;

  const CreateAddOnState({
    this.step = CreateAddOnStep.basicInfo,
    this.title = '',
    this.description = '',
    this.price,
    this.unit = '',
  });

  bool get isFirstStep => step == CreateAddOnStep.values.first;
  bool get isLastStep => step == CreateAddOnStep.values.last;

  CreateAddOnState copyWith({
    CreateAddOnStep? step,
    String? title,
    String? description,
    double? price,
    String? unit,
  }) {
    return CreateAddOnState(
      step: step ?? this.step,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      unit: unit ?? this.unit,
    );
  }
}
