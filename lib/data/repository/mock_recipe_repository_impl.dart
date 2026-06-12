import 'package:flutter_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const MockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
}) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipeById(int id) async {
    final recipe = await getRecipes();
    return recipe.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();
    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
