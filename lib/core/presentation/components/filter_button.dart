import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterButton(this.text,
      {
        super.key,
        this.isSelected = false,
      });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyles.smallTextRegular.copyWith(
          color: isSelected ? AppColors.white : AppColors.primary80,
        ),
      ),
      backgroundColor: isSelected ? AppColors.primary100 : AppColors.white,
      side: BorderSide(color: AppColors.primary100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
