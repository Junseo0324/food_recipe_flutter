import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';

class IngredientRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function(Recipe recipe) onTapFavorite;

  const IngredientRecipeCard({
    super.key,
    required this.recipe,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 315 / 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    Icon(Icons.alarm, color: AppColors.white, size: 17),
                    SizedBox(width: 5),
                    Text(
                      recipe.time,
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: ()=> onTapFavorite(recipe),
                      child: ClipOval(
                        child: Container(
                          color: AppColors.white,
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            color: AppColors.primary80,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.secondary20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: AppColors.rating, size: 12),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left :5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 194,
                  child: Text(
                    recipe.name,
                    style: TextStyles.smallTextBold,
                  ),
                ),
                Spacer(),
                Text(
                    '(13k Reviews)',
                  style: TextStyle(
                    color: AppColors.gray3
                  ),
                ),
                SizedBox(width: 5,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
