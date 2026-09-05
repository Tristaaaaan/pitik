import 'package:flutter/material.dart';
import 'package:pitik/src/core/design/design_tokens.dart';
import 'package:pitik/src/features/domain/entities/package_entity.dart';
import 'package:pitik/src/features/package/presentation/widget/regular_text.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: RegularText(text: "Packages", fontSize: AppTextSize.xl),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  margin: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: PackageContainer(
                    package: PackageEntity(title: "Package", price: 432),
                  ),
                ),
                itemCount: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PackageContainer extends StatelessWidget {
  final PackageEntity package;

  const PackageContainer({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            RegularText(
              text: "Package ${package.title}",
              fontSize: AppTextSize.md,
            ),
            SizedBox(height: AppSpacing.sm),
            RegularText(text: "What's included", fontSize: AppTextSize.sm),
            SizedBox(height: AppSpacing.sm),

            Row(
              children: [
                Icon(Icons.check, size: AppIconSize.md),
                SizedBox(width: AppSpacing.sm),
                RegularText(
                  text: "15 minutes photo session",
                  fontSize: AppTextSize.sm,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        RegularText(text: "₱4,323", fontSize: AppTextSize.md),
      ],
    );
  }
}
