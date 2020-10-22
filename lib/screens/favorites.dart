import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
if(favoriteMeals.isEmpty)
  {
    return Center(
      child: Text('You have no favorites yet -start adding same!'),
    );
  }else{
  return  ListView.builder(
    itemBuilder: (ctx, index) {
      return
        MealItem(
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          id:favoriteMeals[index].id,
        );
    },
    itemCount: favoriteMeals.length,
  );
}

  }
}


