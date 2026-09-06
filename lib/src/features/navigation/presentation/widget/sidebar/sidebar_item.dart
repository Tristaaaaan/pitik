import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';

class SideBarItemData {
  final IconData icon;
  final String label;

  const SideBarItemData({required this.icon, required this.label});
}

class SideBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback onTap;

  const SideBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isExpanded,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? AppColors.primary : Colors.transparent;
    final contentColor = isSelected ? AppColors.white : AppColors.textPrimary;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              mainAxisAlignment: isExpanded
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(icon, size: AppIconSize.md, color: contentColor),
                if (isExpanded) ...[
                  SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: RegularText(
                      text: label,
                      fontSize: AppTextSize.sm,
                      color: contentColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
