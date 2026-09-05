import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/create_package_cubit.dart';
import '../../cubit/create_package_state.dart';

class InclusionStep extends StatelessWidget {
  const InclusionStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePackageCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreatePackageCubit, CreatePackageState>(
      buildWhen: (a, b) => a.inclusions != b.inclusions,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's included?",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Add each item or service included in this package.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: state.inclusions.isEmpty
                  ? Center(
                      child: Text(
                        'No inclusions yet. Tap "Add Inclusion" below.',
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                    )
                  : ListView.separated(
                      itemCount: state.inclusions.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  key: ValueKey('inclusion_$index'),
                                  initialValue: state.inclusions[index],
                                  onChanged: (value) =>
                                      cubit.updateInclusion(index, value),
                                  decoration: InputDecoration(
                                    hintText: 'e.g. Free consultation',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, size: 20),
                                onPressed: () => cubit.removeInclusion(index),
                                tooltip: 'Remove',
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: cubit.addInclusion,
                icon: const Icon(Icons.add),
                label: const Text('Add Inclusion'),
              ),
            ),
          ],
        );
      },
    );
  }
}
