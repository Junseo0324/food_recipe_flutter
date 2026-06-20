import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class DishCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const DishCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 230,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 176,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray4,
              ),
              child: Center(
                child: SizedBox(
                  width: 130,
                  height: 42,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  recipe.time,
                  style: TextStyles.smallerTextBold.copyWith(
                    color: AppColors.gray1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () => onTapFavorite(recipe),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
                child: Icon(
                  size: 16,
                  Icons.bookmark_outline,
                  color: recipe.isFavorite ? AppColors.primary80 : AppColors.gray3,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: SizedBox(
              width: 110,
              height: 110,
              child: CircleAvatar(backgroundImage: NetworkImage(recipe.image)),
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: Container(
              width: 45,
              height: 23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondary20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: AppColors.rating, size: 10),
                  Text(
                    recipe.rating.toString(),
                    style: TextStyles.smallerTextRegular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
