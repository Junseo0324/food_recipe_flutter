import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/route_paths.dart';
import 'package:flutter_recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

import '../../data/repository/mock_bookmark_repository_impl.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../domain/model/recipe.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/saved_recipes/screen/saved_recipes_screen.dart';
import '../../presentation/sign_up/sign_up_screen.dart';
import '../../presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.signUp,
      builder:
          (context, state) => SignUpScreen(
            onTapSignIn: () {
              context.go(RoutePaths.signIn);
            },
          ),
    ),
    GoRoute(
      path: RoutePaths.splash,
      builder:
          (context, state) =>
              SplashScreen(onTapStartCooking: () => context.go(RoutePaths.signIn)),
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder:
          (context, state) => SignInScreen(
            onTapSignUp: () => context.go(RoutePaths.signUp),
            onTapSingIn: () => context.go(RoutePaths.savedRecipes),
          ),
    ),
    GoRoute(
      path: RoutePaths.savedRecipes,
      builder:
          (context, state) => SavedRecipesRoot(),
    ),
  ],
);
