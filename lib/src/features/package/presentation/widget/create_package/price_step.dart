import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/create_package_cubit.dart';
import '../../cubit/create_package_state.dart';

class PriceStep extends StatelessWidget {
  const PriceStep({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreatePackageCubit>();
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<CreatePackageCubit, CreatePackageState>(
      buildWhen: (a, b) => a.price != b.price,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Set the price',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'This is what customers will pay for this package.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: colorScheme.outlineVariant),
              ),
              child: TextFormField(
                key: const ValueKey('price_field'),
                initialValue: state.price == 0.0
                    ? ''
                    : state.price.toStringAsFixed(2),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixText: '₱ ',
                  prefixStyle: Theme.of(context).textTheme.displaySmall
                      ?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                  hintText: '0.00',
                ),
                onChanged: (value) {
                  final parsed = double.tryParse(value) ?? 0.0;
                  cubit.updatePrice(parsed);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
