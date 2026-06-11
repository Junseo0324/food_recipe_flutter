import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.smallTextRegular),
        SizedBox(height: 5,),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary80),
            ),
            hintText: placeholder,
            hintStyle: TextStyles.smallerTextRegular.copyWith(
              color: AppColors.gray4,
            ),
          ),
        )
      ],
    );
  }
}
