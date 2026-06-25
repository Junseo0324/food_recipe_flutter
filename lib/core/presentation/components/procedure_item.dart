import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import '../../../ui/color_styles.dart';

class ProcedureItem extends StatelessWidget {
  final Procedure procedure;

  const ProcedureItem({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.gray4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Step ${procedure.step}',
          ),
          SizedBox(height: 5,),
          Text(
              procedure.content,
              style: TextStyles.smallerTextRegular.copyWith(color: AppColors.gray3),
          ),
        ],
      ),
    );
  }
}
