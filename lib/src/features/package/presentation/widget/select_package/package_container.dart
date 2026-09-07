import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../entities/package_entity.dart';
import '../../cubit/package_cubit.dart';
import '../regular_text.dart';
import 'package_selection_cubit.dart';
import 'package_selection_state.dart';

class PackageContainer extends StatelessWidget {
  final PackageEntity package;

  const PackageContainer({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageSelectionCubit, PackageSelectionState>(
      builder: (context, state) {
        final isSelected = state.isSelected(package);
        final backgroundColor = isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface;
        final textColor = isSelected ? Colors.white : Colors.black;

        return GestureDetector(
          onLongPress: () {
            context.read<PackageCubit>().deletePackage(package.id!);
          },
          onTap: () =>
              context.read<PackageSelectionCubit>().toggleSelection(package),
          child: Container(
            padding: EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.grey,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      text: "Package ${package.title}",
                      fontSize: AppTextSize.md,
                      color: textColor,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    RegularText(
                      text: "What's included",
                      fontSize: AppTextSize.sm,
                      color: textColor,
                    ),
                    SizedBox(height: AppSpacing.sm),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: AppIconSize.md,
                          color: textColor,
                        ),
                        SizedBox(width: AppSpacing.sm),
                        RegularText(
                          text: "15 minutes photo session",
                          fontSize: AppTextSize.sm,
                          color: textColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                RegularText(
                  text: "₱4,323",
                  fontSize: AppTextSize.md,
                  color: textColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
