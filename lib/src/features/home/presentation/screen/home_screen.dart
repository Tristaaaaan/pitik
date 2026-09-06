import 'package:flutter/material.dart';

import '../../../../core/design/design_tokens.dart';
import '../../../order/presentation/screen/order_screen.dart';
import '../../../package/presentation/screen/package_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 3, child: PackageScreen()),
            VerticalDivider(width: 1, color: AppColors.border),
            Expanded(flex: 2, child: OrderScreen()),
          ],
        ),
      ),
    );
  }
}
