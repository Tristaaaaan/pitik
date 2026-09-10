import 'package:flutter/widgets.dart';
import 'package:pitik/src/util/format_currency.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool emphasize;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RegularText(
          text: label,
          fontSize: emphasize ? AppTextSize.md : AppTextSize.sm,
        ),
        RegularText(
          text: formatCurrency(value),
          fontSize: emphasize ? AppTextSize.md : AppTextSize.sm,
        ),
      ],
    );
  }
}
