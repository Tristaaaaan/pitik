import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';
import 'order_summary.dart';

class OrderDetailsContainer extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double total;

  const OrderDetailsContainer({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegularText(text: "Order Details", fontSize: AppTextSize.md),
          SizedBox(height: AppSpacing.sm),
          SummaryRow(label: "Subtotal", value: subtotal),
          SizedBox(height: AppSpacing.xs),
          SummaryRow(label: "Discount", value: -discount),
          Divider(height: AppSpacing.md),
          SummaryRow(label: "Total", value: total, emphasize: true),
        ],
      ),
    );
  }
}
