import '../components/components.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    // TODO 1: Add TodayRecipeListView FutureBuilder
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // TODO: Add Nested List Views
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final recipes = snapshot.data?.todayRecipes ?? []; //if null then []
          // TODO: Replace this with TodayRecipeListView
          return ListView(scrollDirection: Axis.vertical, children: [
            TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
            const SizedBox(height: 16),
            FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            // Container(
            //   height: 400,
            //   color: Colors.green,
            // )
          ]);

          // return Center(
          //   child: Container(
          //     child: const Text('Show TodayRecipeListView'),
          //   ),
          // );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // return const Center(
    //   child: Text('Explore Screen'),
    // );
  }
}
