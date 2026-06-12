import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/recipe_grid_item.dart';
import 'package:flutter_recipe_app/presentation/search/search_state.dart';

import '../../core/presentation/components/search_input_field.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String query)? onChanged;

  const SearchScreen({super.key, required this.state, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    placeholder: 'Search Recipe',
                    onChanged: onChanged,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary100,
                  ),
                  child: Icon(Icons.tune, color: AppColors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Recent Search', style: TextStyles.normalTextBold),
            const SizedBox(height: 20),
            Expanded(
              child:
                  state.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                            ),
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = state.recipes[index];
                          return RecipeGridItem(recipe: recipe);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
