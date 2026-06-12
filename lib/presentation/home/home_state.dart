import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';

part 'home_state.freezed.dart';


@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Recipe> recipes,
    @Default(true) bool isLoading,
  }) = _HomeState;
}