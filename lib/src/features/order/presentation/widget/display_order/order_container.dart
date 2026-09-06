import 'package:flutter/widgets.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';

class OrderSectionContainer extends StatelessWidget {
  final String title;
  final int count;
  final List<Widget> children;

  const OrderSectionContainer({
    super.key,
    required this.title,
    required this.count,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegularText(text: title, fontSize: AppTextSize.md),
              RegularText(
                text: "$count item${count == 1 ? '' : 's'} selected",
                fontSize: AppTextSize.sm,
                color: AppColors.textSecondary,
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          if (children.isEmpty)
            RegularText(
              text: "No $title selected",
              fontSize: AppTextSize.sm,
              color: AppColors.textSecondary,
            )
          else
            ...children,
        ],
      ),
    );
  }
}
