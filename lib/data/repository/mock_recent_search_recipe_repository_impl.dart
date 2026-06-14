import 'package:flutter_recipe_app/data/data_source/local_storage.dart';
import 'package:flutter_recipe_app/domain/model/recipe.dart';
import 'package:flutter_recipe_app/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRecipeRepository {
  final LocalStorage _localStorage;

  const MockRecentSearchRecipeRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    final json = await _localStorage.load();
    return (json['recipes']! as Iterable)
        .map((e) => Recipe.fromJson(e))
        .toList();
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) async{
    _localStorage.save({
      'recipes': recipes.map((e) => e.toJson()).toList(),
    });
  }
}
