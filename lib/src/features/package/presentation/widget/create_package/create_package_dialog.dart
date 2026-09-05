import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/core/design/design_tokens.dart';

import '../../../entities/package_entity.dart';
import '../../cubit/create_package_cubit.dart';
import '../../cubit/create_package_state.dart';
import 'basic_info_step.dart';
import 'inclusion_step.dart';
import 'note_step.dart';
import 'price_step.dart';
import 'step_progress_indicator.dart';

Future<PackageEntity?> showCreatePackageDialog(BuildContext context) {
  return showDialog<PackageEntity>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider(
      create: (_) => CreatePackageCubit(),
      child: const CreatePackageDialog(),
    ),
  );
}

class CreatePackageDialog extends StatelessWidget {
  const CreatePackageDialog({super.key});

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
          child: BlocBuilder<CreatePackageCubit, CreatePackageState>(
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
                  StepProgressIndicator(currentStep: state.step),
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
                              .read<CreatePackageCubit>()
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
                          state.isLastStep ? 'Create Package' : 'Continue',
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

  Widget _stepBody(CreatePackageStep step) {
    switch (step) {
      case CreatePackageStep.basicInfo:
        return const BasicInfoStep();
      case CreatePackageStep.inclusion:
        return const InclusionStep();
      case CreatePackageStep.price:
        return const PriceStep();
      case CreatePackageStep.note:
        return const NoteStep();
    }
  }

  void _onPrimaryAction(BuildContext context, CreatePackageState state) {
    final cubit = context.read<CreatePackageCubit>();
    if (state.isLastStep) {
      final package = cubit.buildPackage();
      Navigator.of(context).pop(package);
    } else {
      cubit.nextStep();
    }
  }
}
