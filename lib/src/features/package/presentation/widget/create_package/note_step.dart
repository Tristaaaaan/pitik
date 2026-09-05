import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/create_package_cubit.dart';
import '../../cubit/create_package_state.dart';

class NoteStep extends StatelessWidget {
  const NoteStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePackageCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreatePackageCubit, CreatePackageState>(
      buildWhen: (a, b) => a.isAvailable != b.isAvailable,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notes for customers',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'These notes will be visible to customers viewing this package.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onChanged: cubit.updateNote,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Note',
                  hintText: 'e.g. Valid for 30 days from purchase date...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Available to customers'),
                  subtitle: Text(
                    state.isAvailable
                        ? 'This package will be visible and purchasable.'
                        : 'This package will be hidden from customers.',
                  ),
                  value: state.isAvailable,
                  onChanged: cubit.toggleAvailability,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
