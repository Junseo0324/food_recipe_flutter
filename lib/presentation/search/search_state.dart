import 'package:flutter_recipe_app/domain/filter/filter_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'search_state.freezed.dart';


@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> recipes,
    @Default(true) bool isLoading,
    @Default('Recent Search') String searchTitle,
    @Default('') String resultsCount,
    @Default(FilterState(time: 'Newest', rate: 4, category: 'Local Dish'))
    FilterState filterState,
  }) = _SearchState;
}