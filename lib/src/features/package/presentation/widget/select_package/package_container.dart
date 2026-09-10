import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../../util/format_currency.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RegularText(
                            text: "Package ${package.title}",
                            fontSize: AppTextSize.md,
                            color: textColor,
                          ),
                          Spacer(),
                          Spacer(),
                          package.price == 0
                              ? Text("Free", style: TextStyle(color: textColor))
                              : RegularText(
                                  text: formatCurrency(package.price),
                                  fontSize: AppTextSize.md,
                                  color: textColor,
                                ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.sm),
                      if (package.branding != null) ...[
                        RegularText(
                          text: package.branding!,
                          fontSize: AppTextSize.sm,
                          color: textColor,
                        ),
                        SizedBox(height: AppSpacing.sm),
                      ],
                      if (package.description != null) ...[
                        RegularText(
                          text: package.description!,
                          fontSize: AppTextSize.sm,
                          color: isSelected ? Colors.black : Colors.black,
                        ),
                        SizedBox(height: AppSpacing.sm),
                      ],
                      if (package.note != null) ...[
                        Container(
                          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: textColor,
                                size: 20,
                              ),
                              SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RegularText(
                                      text:
                                          "AHAHH ahh hdahd hhk shdkshjk lore m dhsajkdhajks  hjkdsahdjk ahsjk dsahdjkshdjkshdjkshdjksdsd",
                                      fontSize: 13,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      RegularText(
                        text: "What's included",
                        fontSize: AppTextSize.sm,
                        color: textColor,
                      ),
                      SizedBox(height: AppSpacing.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: package.inclusion.map((inclusion) {
                          return Row(
                            children: [
                              Icon(
                                Icons.check,
                                size: AppIconSize.md,
                                color: textColor,
                              ),
                              SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: RegularText(
                                  text: inclusion,
                                  fontSize: AppTextSize.sm,
                                  color: textColor,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
