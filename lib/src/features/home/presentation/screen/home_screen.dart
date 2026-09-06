import 'package:flutter/material.dart';

import '../../../../core/design/design_tokens.dart';
import '../../../navigation/presentation/widget/sidebar/sidebar.dart';
import '../../../order/presentation/screen/order_screen.dart';
import '../../../package/presentation/screen/package_screen.dart';
import '../../../settings/presentation/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    Placeholder(), // 0: Dashboard
    PackageScreen(), // 1: Inventory
    SettingsScreen(), // 2: Report
    SettingsScreen(), // 2: Report
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SideBar(
              selectedIndex: _selectedIndex,
              onItemSelected: (index) {
                setState(() => _selectedIndex = index);
              },
            ),
            Expanded(
              flex: 3,
              child: IndexedStack(index: _selectedIndex, children: _screens),
            ),
            VerticalDivider(width: 1, color: AppColors.border),
            Expanded(flex: 2, child: OrderScreen()),
          ],
        ),
      ),
    );
  }
}
