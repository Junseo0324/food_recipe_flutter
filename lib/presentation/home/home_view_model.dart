import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeState _state = const HomeState();

  HomeState get state => _state;

  
}