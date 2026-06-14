import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class SearchInputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool isReadOnly;
  final void Function(String query)? onChanged;

  const SearchInputField({
    super.key,
    required this.placeholder,
    this.controller,
    this.isReadOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.gray4),
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
      ),
    );
  }
}
