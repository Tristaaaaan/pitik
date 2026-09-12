import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../regular_button.dart';
import '../regular_text.dart';

class PackageHeader extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const PackageHeader({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.md,
          horizontal: AppSpacing.md,
        ),
        child: Row(
          children: [
            RegularText(text: title, fontSize: AppTextSize.xl),
            Spacer(),
            RegularButton(
              onTap: onTap,
              text: "New",
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.surface,
              buttonKey: "newPackage",
              width: 125,
            ),
          ],
        ),
      ),
    );
  }
}
