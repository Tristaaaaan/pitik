import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../../util/format_currency.dart';
import '../../../../package/presentation/widget/regular_text.dart';

class OrderItemTile extends StatelessWidget {
  final String title;
  final double price;
  final VoidCallback onRemove;

  const OrderItemTile({
    super.key,
    required this.title,
    required this.price,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: AppSpacing.sm),
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: RegularText(text: title, fontSize: AppTextSize.sm),
          ),
          RegularText(text: formatCurrency(price), fontSize: AppTextSize.sm),
          SizedBox(width: AppSpacing.sm),
          IconButton(
            icon: Icon(
              Icons.close,
              size: AppIconSize.sm,
              color: AppColors.error,
            ),
            onPressed: onRemove,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
