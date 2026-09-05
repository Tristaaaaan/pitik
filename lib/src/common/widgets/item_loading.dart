import 'package:flutter/material.dart';
import 'package:pitik/src/common/widgets/skeleton.dart';
import 'package:pitik/src/core/design/design_tokens.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xs),
      ),
      child: Skeleton(height: 45, width: double.infinity),
    );
  }
}
