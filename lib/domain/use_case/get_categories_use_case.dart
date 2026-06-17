import 'dart:io';

import 'package:flutter_recipe_app/core/domain/error/result.dart';
import 'package:flutter_recipe_app/domain/repository/recipe_repository.dart';

import '../../core/domain/error/network_error.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try {
      final results = await _recipeRepository.getRecipes();
      return Result.success([
        'All',
        ...results.map((e) => e.category).toSet()
      ]);
    } on SocketException {
      return Result.error(NetworkError.noInternet);
    }catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
