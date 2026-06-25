import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../domain/model/ingredient.dart';
import '../../../ui/color_styles.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.gray4,
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
            child: Image.network(ingredient.image, width: 40, height: 40),
          ),
          SizedBox(width: 16),
          Text(
            ingredient.name,
            style: TextStyles.normalTextBold,
          ),
          Spacer(),
          Text(
            '500g',
            style: TextStyles.smallTextRegular.copyWith(color: AppColors.gray3),
          ),

        ],
      ),
    );
  }
}
