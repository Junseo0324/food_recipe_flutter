import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final results = await _recipeRepository.getRecipes();
    return ['All', ...results.map((e) => e.category).toSet()];
  }
}
