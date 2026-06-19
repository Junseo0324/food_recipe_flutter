import 'package:flutter_recipe_app/core/domain/error/result.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

import '../error/new_recipe_error.dart';

class GetNewRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetNewRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<Recipe>, NewRecipeError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();

      if (recipes.isEmpty) {
        return Result.error(NewRecipeError.noRecipe);
      }

      if (recipes.any((e) => e.category.isEmpty)) {
        return Result.error(NewRecipeError.invalidCategory);
      }

      return Result.success(recipes.take(5).toList());
    } catch (e) {
      return Result.error(NewRecipeError.unknown);
    }
  }
}
