import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/create_addon_cubit.dart';
import '../../cubit/create_addon_state.dart';

class AddOnUnitStep extends StatelessWidget {
  const AddOnUnitStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAddOnCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreateAddOnCubit, CreateAddOnState>(
      buildWhen: (a, b) => a.unit != b.unit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Unit',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'How is this add-on charged? e.g. per person, per piece.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: state.unit,
              onChanged: cubit.updateUnit,
              decoration: const InputDecoration(
                labelText: 'Unit',
                hintText: 'e.g. per person, per piece',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      },
    );
  }
}
