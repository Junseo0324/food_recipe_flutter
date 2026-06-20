import 'package:flutter_recipe_app/domain/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getProcedures();
  Future<List<Procedure>> getProceduresByRecipeId(int recipeId);

}