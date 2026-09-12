import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../domain/entity/addon_entity.dart';
import '../../cubit/create_addon_cubit.dart';
import '../../cubit/create_addon_state.dart';
import 'addon_basic_info_step.dart';
import 'addon_price_step.dart';
import 'addon_step_progress_indicator.dart';
import 'addon_unit_step.dart';

Future<AddOnEntity?> showCreateAddOnDialog(BuildContext context) {
  return showDialog<AddOnEntity>(
    context: context,
    barrierDismissible: false,
    builder: (_) => CreateAddOnDialog(),
  );
}

class CreateAddOnDialog extends StatelessWidget {
  const CreateAddOnDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520, maxHeight: 620),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: BlocBuilder<CreateAddOnCubit, CreateAddOnState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: 'Cancel',
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.md),
                  AddOnStepProgressIndicator(currentStep: state.step),
                  const SizedBox(height: AppSpacing.md),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: KeyedSubtree(
                        key: ValueKey(state.step),
                        child: _stepBody(state.step),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      if (!state.isFirstStep)
                        OutlinedButton(
                          onPressed: context
                              .read<CreateAddOnCubit>()
                              .previousStep,
                          child: const Text('Back'),
                        ),
                      const Spacer(),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.surface,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () => _onPrimaryAction(context, state),
                        child: Text(
                          state.isLastStep ? 'Create Add-on' : 'Continue',
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _stepBody(CreateAddOnStep step) {
    switch (step) {
      case CreateAddOnStep.basicInfo:
        return const AddOnBasicInfoStep();
      case CreateAddOnStep.price:
        return const AddOnPriceStep();
      case CreateAddOnStep.unit:
        return const AddOnUnitStep();
    }
  }

  void _onPrimaryAction(BuildContext context, CreateAddOnState state) {
    final cubit = context.read<CreateAddOnCubit>();
    if (state.isLastStep) {
      final addOn = cubit.buildAddOn();
      Navigator.of(context).pop(addOn);
    } else {
      cubit.nextStep();
    }
  }
}
