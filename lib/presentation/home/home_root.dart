import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/di/di_setup.dart';
import 'package:flutter_recipe_app/core/routing/route_paths.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/home/home_viewmodel.dart';
import 'package:go_router/go_router.dart';

class HomeRoot extends StatelessWidget {
  const HomeRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return HomeScreen(
          state: viewModel.state,
          name: 'Jega',
          onTapSearchField: () => context.push(RoutePaths.search),
          onSelectCategory: viewModel.onSelectCategory,
        );
      },
    );
  }
}
