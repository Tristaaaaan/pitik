import 'package:flutter/material.dart';

import '../../../../../core/design/design_tokens.dart';
import '../../../../package/presentation/widget/regular_text.dart';
import 'sidebar_item.dart';

class SideBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SideBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _isExpanded = true;
  String _searchQuery = "";

  static const List<SideBarItemData> _items = [
    SideBarItemData(icon: Icons.dashboard_outlined, label: "Dashboard"),
    SideBarItemData(icon: Icons.inventory_2_outlined, label: "Inventory"),
    SideBarItemData(icon: Icons.bar_chart_outlined, label: "Report"),
    SideBarItemData(icon: Icons.settings_outlined, label: "Settings"),
  ];

  List<SideBarItemData> get _filteredItems {
    if (_searchQuery.isEmpty) return _items;
    return _items
        .where(
          (item) =>
              item.label.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _isExpanded ? 240 : 72,
        color: AppColors.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Row(
                mainAxisAlignment: _isExpanded
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  if (_isExpanded)
                    RegularText(text: "Pitik", fontSize: AppTextSize.lg),
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.menu_open : Icons.menu,
                      size: AppIconSize.md,
                    ),
                    onPressed: () {
                      setState(() => _isExpanded = !_isExpanded);
                    },
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, size: AppIconSize.sm),
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      borderSide: BorderSide(color: AppColors.border),
                    ),
                  ),
                ),
              ),
            SizedBox(height: AppSpacing.md),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final originalIndex = _items.indexOf(item);
                  return SideBarItem(
                    icon: item.icon,
                    label: item.label,
                    isExpanded: _isExpanded,
                    isSelected: widget.selectedIndex == originalIndex,
                    onTap: () => widget.onItemSelected(originalIndex),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
