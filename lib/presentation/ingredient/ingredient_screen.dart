import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/chef_profile.dart';
import 'package:flutter_recipe_app/core/presentation/components/ingredient_item.dart';
import 'package:flutter_recipe_app/core/presentation/components/ingredient_recipe_card.dart';
import 'package:flutter_recipe_app/core/presentation/components/procedure_item.dart';
import 'package:flutter_recipe_app/core/presentation/components/two_tabs.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

enum IngredientMenu { share, rate, review, unSave }

class IngredientScreen extends StatelessWidget {
  final IngredientState state;
  final void Function(IngredientAction action) onAction;
  final void Function(IngredientMenu menu) onTapMenu;

  const IngredientScreen({
    super.key,
    required this.state,
    required this.onTapMenu,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_horiz, size: 24),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.share),
                  child: Row(
                    children: [
                      Icon(Icons.share, size: 20),
                      SizedBox(width: 16),
                      Text('Share', style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.rate),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 20),
                      SizedBox(width: 16),
                      Text('Rate Recipes', style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.review),
                  child: Row(
                    children: [
                      Icon(Icons.comment, size: 20),
                      SizedBox(width: 16),
                      Text('Review', style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => onTapMenu(IngredientMenu.unSave),
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, size: 20),
                      SizedBox(width: 16),
                      Text('Unsave', style: TextStyles.smallTextRegular),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              IngredientRecipeCard(
                recipe: state.recipe!,
                onTapFavorite: (recipe) {},
              ),
              SizedBox(height: 10),
              ChefProfile(),
              SizedBox(height: 20),
              TwoTabs(
                selectedIndex: state.selectedTabIndex,
                labels: ['Ingredient', 'Procedure'],
                onChange: (index) {
                  if (index == 0) {
                    onAction(IngredientAction.onTapIngredient());
                  } else {
                    onAction(IngredientAction.onTapProcedure());
                  }
                },
              ),
              SizedBox(height: 35),

              Expanded(
                child: IndexedStack(
                  index: state.selectedTabIndex,
                  children: [
                    IngredientList(state: state),
                    ProcedureList(state: state),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.state});

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.room_service, size: 17, color: AppColors.gray3),
            SizedBox(width: 5),
            Text(
              '1 serve',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
            Spacer(),
            Text(
              '${state.ingredients.length} Items',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
        SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.ingredients.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientItem(ingredient: state.ingredients[index]),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProcedureList extends StatelessWidget {
  const ProcedureList({super.key, required this.state});

  final IngredientState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.room_service, size: 17, color: AppColors.gray3),
            SizedBox(width: 5),
            Text(
              '1 serve',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
            Spacer(),
            Text(
              '${state.procedures.length} Steps',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
        SizedBox(height: 23.5),
        Expanded(
          child: ListView.builder(
            itemCount: state.procedures.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProcedureItem(procedure: state.procedures[index]),
                  SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
