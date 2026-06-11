import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/search_input_field.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello $name', style: TextStyles.largeTextBold),
                    const SizedBox(height: 5),
                    Text(
                      'What are you cooking today?',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: AppColors.gray3,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondary40,
                  ),
                  child: Icon(
                    Icons.person_2,
                    color: AppColors.primary40,
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                    child: SearchInputField(placeholder: 'Search Recipe')
                ),
                SizedBox(width: 20,),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary100,
                  ),
                  child: Icon(
                    Icons.tune,
                    color: AppColors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
