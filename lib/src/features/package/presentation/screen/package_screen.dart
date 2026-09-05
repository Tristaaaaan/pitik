import 'dart:developer' as develoer;

import 'package:flutter/material.dart';

import '../../../../core/design/design_tokens.dart';
import '../../entities/package_entity.dart';
import '../widget/create_package/create_package_dialog.dart';
import '../widget/regular_button.dart';
import '../widget/regular_text.dart';

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
                child: Row(
                  children: [
                    RegularText(text: "Packages", fontSize: AppTextSize.xl),
                    SizedBox(width: 25),
                    RegularButton(
                      onTap: () async {
                        final newPackage = await showCreatePackageDialog(
                          context,
                        );
                        develoer.log("newPackage: $newPackage");

                        if (newPackage != null) {
                          // context.read<PackageCubit>().createPackage(
                          //   newPackage,
                          // );
                        }
                      },
                      text: "New",
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.surface,
                      buttonKey: "newPackage",
                      width: 125,
                    ),
                  ],
                ),
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
