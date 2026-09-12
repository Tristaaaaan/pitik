import 'package:flutter/material.dart';
import 'package:pitik/src/features/addons/presentation/cubit/create_addon_state.dart';

class AddOnStepProgressIndicator extends StatelessWidget {
  const AddOnStepProgressIndicator({super.key, required this.currentStep});

  final CreateAddOnStep currentStep;

  @override
  Widget build(BuildContext context) {
    final steps = CreateAddOnStep.values;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              final leftIndex = i ~/ 2;
              final isPastConnector = leftIndex < currentStep.index;
              return Expanded(
                child: Container(
                  height: 3,
                  color: isPastConnector
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                ),
              );
            }

            final stepIndex = i ~/ 2;
            final step = steps[stepIndex];
            final isActive = step.index == currentStep.index;
            final isCompleted = step.index < currentStep.index;

            return Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted || isActive
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
                border: Border.all(
                  color: isActive ? colorScheme.primary : Colors.transparent,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 16, color: colorScheme.surface)
                  : Text(
                      '${stepIndex + 1}',
                      style: TextStyle(
                        color: isActive
                            ? colorScheme.surface
                            : colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          'Step ${currentStep.index + 1} of ${steps.length} · ${currentStep.label}',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
