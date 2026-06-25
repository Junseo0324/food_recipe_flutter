import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/small_button.dart';
import 'package:flutter_recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            'https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg',
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Laura wilson', style: TextStyles.smallTextBold),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.primary80, size: 17),
                Text(
                  'Laogs, Bigeria',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        SmallButton('Follow', onPressed: () {}),
      ],
    );
  }
}
