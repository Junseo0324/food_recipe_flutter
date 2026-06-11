import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/two_tabs.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Components', style: TextStyles.largeTextBold),
      ),
      body: ListView(
        children: [
          TwoTabs(
            labels: ['label1','label2'],
            selectedIndex: 0,
            onChange: (index) {
              print(index);
            },
          ),
          RatingButton('text'),
          RatingButton('text',isSelected: true,),
          FilterButton('text'),
          FilterButton('text',isSelected: true,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              'Big Button',
              onPressed: () {
                print('big button');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              'medium button',
              onPressed: () {
                print('medium button');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              'small button',
              onPressed: () {
                print('small button');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const InputField(label: 'label', placeholder: 'placeholder'),
          ),
        ],
      ),
    );
  }
}
