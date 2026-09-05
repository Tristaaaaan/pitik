import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/create_package_cubit.dart';

class BasicInfoStep extends StatelessWidget {
  const BasicInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePackageCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's set up your package",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Give it a name and a short description. You can skip these for now.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            onChanged: cubit.updateTitle,
            decoration: const InputDecoration(
              labelText: 'Package Name (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: cubit.updateBranding,
            decoration: const InputDecoration(
              labelText: 'Branding (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            onChanged: cubit.updateDescription,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Description (optional)',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }
}
