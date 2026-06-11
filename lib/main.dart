import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/two_tabs.dart';
import 'package:flutter_recipe_app/core/presentation/dialogs/rating_dialog.dart';
import 'package:flutter_recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import 'core/presentation/components/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}
