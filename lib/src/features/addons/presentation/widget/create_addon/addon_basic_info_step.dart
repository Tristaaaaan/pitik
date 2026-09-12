import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/addons/presentation/cubit/create_addon_cubit.dart';
import 'package:pitik/src/features/addons/presentation/cubit/create_addon_state.dart';

class AddOnBasicInfoStep extends StatelessWidget {
  const AddOnBasicInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAddOnCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreateAddOnCubit, CreateAddOnState>(
      buildWhen: (a, b) => a.title != b.title || a.description != b.description,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic info',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Give this add-on a name and describe what it offers.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: state.title,
                onChanged: cubit.updateTitle,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'e.g. Extra hour of coverage',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: state.description,
                onChanged: cubit.updateDescription,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'What does this add-on include?',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
