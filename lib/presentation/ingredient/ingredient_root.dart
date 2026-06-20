import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/di/di_setup.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app/presentation/ingredient/ingredient_screen.dart';

import 'ingredient_view_model.dart';

class IngredientRoot extends StatelessWidget {
  final int recipeId;

  const IngredientRoot({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<IngredientViewModel>();
    viewModel.onAction(IngredientAction.loadRecipe(recipeId));
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return IngredientScreen(
          state: viewModel.state,
          onAction: viewModel.onAction,
        );
      },
    );
  }
}
