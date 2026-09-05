import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double? height;
  final double? width;
  const Skeleton({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
