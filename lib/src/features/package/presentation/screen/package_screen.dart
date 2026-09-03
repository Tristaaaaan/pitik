import 'package:flutter/material.dart';

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
          // SliverMainAxisGroup(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: RegularText(text: "Packages", fontSize: AppTextSize.xl),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
