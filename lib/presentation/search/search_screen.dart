import 'package:flutter/material.dart';

import '../../ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: TextStyles.mediumTextBold),
        centerTitle: true,
      ),
      body: Column(

      ),
    );
  }
}
