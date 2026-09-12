import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/common/state/read_state.dart';
import 'package:pitik/src/features/addons/presentation/cubit/addon_cubit.dart';
import 'package:pitik/src/features/addons/presentation/widget/create_addon/create_addon_dialog.dart';
import 'package:pitik/src/features/addons/presentation/widget/read_addon/addon_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widgets/item_loading.dart';
import '../../../../common/widgets/place_holder.dart';
import '../../../../core/animation/app_animations.dart';
import '../../../../core/design/design_tokens.dart';
import '../cubit/package_cubit.dart';
import '../cubit/package_state.dart';
import '../widget/create_package/create_package_dialog.dart';
import '../widget/select_package/package_container.dart';
import '../widget/select_package/package_header.dart';

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
              PackageHeader(
                title: "Package",
                onTap: () async {
                  final newPackage = await showCreatePackageDialog(context);
                  developer.log("newPackage: $newPackage");

                  if (newPackage != null) {
                    if (!context.mounted) return;
                    context.read<PackageCubit>().createPackage(newPackage);
                  }
                },
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
                              padding: const EdgeInsets.all(AppSpacing.xs),
                              margin: const EdgeInsets.only(
                                bottom: AppSpacing.xs,
                                right: AppSpacing.md,
                                left: AppSpacing.xs,
                              ),
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
              PackageHeader(
                title: "Add ons",
                onTap: () async {
                  final newAddOn = await showCreateAddOnDialog(context);
                  developer.log("newAddOn: $newAddOn");

                  if (newAddOn != null) {
                    if (!context.mounted) return;
                    context.read<AddOnCubit>().createAddOn(newAddOn);
                  }
                },
              ),

              BlocBuilder<AddOnCubit, ReadState>(
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
                          title: 'No Add Ons Yet',
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

                            final addOn = data[index];

                            return Container(
                              padding: const EdgeInsets.all(AppSpacing.xs),
                              margin: const EdgeInsets.only(
                                bottom: AppSpacing.xs,
                                right: AppSpacing.md,
                                left: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.sm,
                                ),
                              ),
                              child: AddOnContainer(addOn: addOn),
                            );
                          },
                          childCount: hasMore ? data!.length + 1 : data!.length,
                        ),
                      );
                    },
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
