import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../regular_text.dart';

class PackageInclusion extends StatefulWidget {
  final List<String> inclusions;
  final Color textColor;

  const PackageInclusion({
    super.key,
    required this.inclusions,
    required this.textColor,
  });

  @override
  State<PackageInclusion> createState() => PackageInclusionState();
}

class PackageInclusionState extends State<PackageInclusion> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          onTap: () {
            // Stop this tap from bubbling up to the card's own onTap
            // (which toggles package selection).
            setState(() => _expanded = !_expanded);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RegularText(
                  text: "What's included",
                  fontSize: AppTextSize.sm,
                  color: widget.textColor,
                ),
                SizedBox(width: AppSpacing.sm),
                AnimatedRotation(
                  turns: _expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: AppIconSize.md,
                    color: widget.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.topLeft,
          child: !_expanded
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.inclusions.map((inclusion) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: AppIconSize.md,
                            color: widget.textColor,
                          ),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: RegularText(
                              text: inclusion,
                              fontSize: AppTextSize.sm,
                              color: widget.textColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
