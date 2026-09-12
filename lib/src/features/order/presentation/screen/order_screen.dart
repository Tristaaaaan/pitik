import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_selection_cubit.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_selection_state.dart';

import '../../../../core/design/design_tokens.dart';
import '../../../package/presentation/widget/regular_button.dart';
import '../../../package/presentation/widget/regular_text.dart';
import '../../../package/presentation/widget/select_package/package_selection_cubit.dart';
import '../../../package/presentation/widget/select_package/package_selection_state.dart';
import '../widget/display_order/order_container.dart';
import '../widget/display_order/order_details_container.dart';
import '../widget/display_order/order_item_tile.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText(text: "Order Summary", fontSize: AppTextSize.lg),
              SizedBox(height: AppSpacing.xs),
              RegularText(
                text:
                    "Review your selected packages and add-ons before checkout",
                fontSize: AppTextSize.sm,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: AppSpacing.md),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Packages Order Container ---
                      BlocBuilder<PackageSelectionCubit, PackageSelectionState>(
                        builder: (context, state) {
                          return OrderSectionContainer(
                            title: "Packages",
                            count: state.selectedPackages.length,
                            children: state.selectedPackages.map((package) {
                              return OrderItemTile(
                                title: package.title,
                                price: package.price,
                                onRemove: () => context
                                    .read<PackageSelectionCubit>()
                                    .toggleSelection(package),
                              );
                            }).toList(),
                          );
                        },
                      ),
                      SizedBox(height: AppSpacing.md),

                      // --- Add-ons Order Container (now live) ---
                      BlocBuilder<AddOnSelectionCubit, AddOnSelectionState>(
                        builder: (context, state) {
                          final selected = state.selectedAddOns;
                          return OrderSectionContainer(
                            title: "Add-ons",
                            count: selected.length,
                            children: selected.map((entry) {
                              final addOn = entry.key;
                              final value = entry.value;
                              return OrderItemTile(
                                title: addOn.title ?? '',
                                price: value.toDouble(),
                                onRemove: () => context
                                    .read<AddOnSelectionCubit>()
                                    .setValue(addOn, 0),
                              );
                            }).toList(),
                          );
                        },
                      ),
                      SizedBox(height: AppSpacing.md),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.md),
              Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child:
                    BlocBuilder<PackageSelectionCubit, PackageSelectionState>(
                      builder: (context, packageState) {
                        return BlocBuilder<
                          AddOnSelectionCubit,
                          AddOnSelectionState
                        >(
                          builder: (context, addOnState) {
                            final packagesTotal = packageState.selectedPackages
                                .fold<double>(0, (sum, p) => sum + p.price);
                            final addOnsTotal = addOnState.selectedAddOns
                                .fold<double>(
                                  0,
                                  (sum, entry) => sum + entry.value,
                                );
                            final subtotal = packagesTotal + addOnsTotal;

                            const double discount = 0;
                            final total = subtotal - discount;

                            return OrderDetailsContainer(
                              subtotal: subtotal,
                              discount: discount,
                              total: total,
                            );
                          },
                        );
                      },
                    ),
              ),
              SizedBox(
                width: double.infinity,
                child: RegularButton(
                  text: "Continue Transaction",
                  onTap: () {},
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.surface,
                  buttonKey: "continueTransaction",
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
