import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const MainScreen({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        onDestinationSelected: onChangeIndex,
        selectedIndex: currentPageIndex,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined, color: AppColors.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.home, color: AppColors.primary40),
                Icon(Icons.home_outlined, color: AppColors.primary100),
              ],
            ),
            label: 'home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.bookmark_border, color: AppColors.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.bookmark, color: AppColors.primary40),
                Icon(Icons.bookmark_border, color: AppColors.primary100)
              ],
            ),
            label: 'bookmark',
          ),
          const NavigationDestination(
            icon: Icon(Icons.notifications_outlined, color: AppColors.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.notifications, color: AppColors.primary40),
                Icon(Icons.notifications_outlined, color: AppColors.primary100)
              ],
            ),
            label: 'notifications',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.gray4),
            selectedIcon: Stack(
              children: [
                Icon(Icons.person, color: AppColors.primary40),
                Icon(Icons.person_outlined, color: AppColors.primary100)
              ],
            ),

            label: 'person',
          ),
        ],
      ),
    );
  }
}
