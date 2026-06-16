import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RecipeCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final void Function(String category) onSelectCategory;

  const RecipeCategorySelector({
    super.key,
    required this.categories,
    required this.onSelectCategory,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((e) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onSelectCategory(e);
            }, child: e == selectedCategory
              ? SelectedCategory(category: e)
              : UnSelectedCategory(category: e),
          );
        }).toList(),
      ),
    );
  }
}

class SelectedCategory extends StatelessWidget {
  final String category;

  const SelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary100,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(color: AppColors.white),
      ),
    );
  }
}

class UnSelectedCategory extends StatelessWidget {
  final String category;

  const UnSelectedCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Text(
        category,
        style: TextStyles.smallerTextBold.copyWith(color: AppColors.primary80),
      ),
    );
  }
}
