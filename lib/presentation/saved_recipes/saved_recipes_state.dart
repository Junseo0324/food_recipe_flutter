import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';


@freezed
abstract class SavedRecipesState with _$SavedRecipesState {
  const factory SavedRecipesState({
    @Default([]) List<Recipe> recipes,
    @Default(true) bool isLoading,
  }) = _SavedRecipesState;
}