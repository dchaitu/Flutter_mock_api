import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final exploreService = MockFooderlichService();
  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
      // 3
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // TODO: Add RecipesGridView Here
          return RecipesGridView(recipes: snapshot.data ?? []);

          // 5
          // return const Center(child: Text('Recipes Screen'));
        } else {
          // 6
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
