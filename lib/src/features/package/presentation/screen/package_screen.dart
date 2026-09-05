import 'dart:developer' as develoer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/common/widgets/item_loading.dart';
import 'package:pitik/src/common/widgets/place_holder.dart';
import 'package:pitik/src/core/animation/app_animations.dart';
import 'package:pitik/src/features/package/presentation/cubit/package_cubit.dart';
import 'package:pitik/src/features/package/presentation/cubit/package_state.dart';
import 'package:shimmer/shimmer.dart';

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
                          if (!context.mounted) return;
                          context.read<PackageCubit>().createPackage(
                            newPackage,
                          );
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
              BlocBuilder<PackageCubit, PackageState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[800]!,
                          highlightColor: Colors.grey[700]!,
                          child: Column(
                            children: List.generate(
                              5,
                              (index) => const ItemLoading(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    loading: () => SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[800]!,
                          highlightColor: Colors.grey[700]!,
                          child: Column(
                            children: List.generate(
                              5,
                              (index) => const ItemLoading(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    error: (error) => SliverFillRemaining(
                      child: Center(
                        child: DataPlaceHolder(
                          titleTextSize: AppTextSize.lg,
                          descriptionTextSize: AppTextSize.sm,
                          imagePath: AppAnimations.emptyBoo,
                          imageHeight: 250,
                          imageWidth: 300,
                          title: 'Something Went Wrong',
                          description: "We couldn't load your packages.",
                          withButton: false,
                          onTap: () {
                            context.read<PackageCubit>().fetchInitial();
                          },
                        ),
                      ),
                    ),
                    empty: () => SliverFillRemaining(
                      child: Center(
                        child: DataPlaceHolder(
                          titleTextSize: AppTextSize.lg,
                          descriptionTextSize: AppTextSize.sm,
                          imagePath: AppAnimations.emptyBoo,
                          imageHeight: 250,
                          imageWidth: 300,
                          title: 'No Packages Yet',
                          description:
                              "Tap \"New\" to create your first package.",
                          withButton: false,
                          onTap: () {},
                        ),
                      ),
                    ),
                    loaded: (data, hasMore) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (index >= data.length) {
                              context.read<PackageCubit>().loadMore();
                              return const Padding(
                                padding: EdgeInsets.all(AppSpacing.md),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final package = data[index];

                            return Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              margin: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.sm,
                                ),
                              ),
                              child: PackageContainer(package: package),
                            );
                          },
                          childCount: hasMore ? data!.length + 1 : data!.length,
                        ),
                      );
                    },
                  );
                },
              ),

              BlocBuilder<PackageCubit, PackageState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (data, hasMore) {
                      if (!hasMore && data!.length > 10) {
                        return SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                              child: RegularText(
                                text: "nothing follows",
                                fontSize: AppTextSize.md,
                              ),
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                    orElse: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                  );
                },
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
