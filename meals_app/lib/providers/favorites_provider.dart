import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // If the meal is in the favorites and we toggle it off, then we only want to show those that have a different id (so we basically remove that item from the favorites list)
    } else {
      state = [
        ...state,
        meal
      ]; // If the meal isn't in the favorites, then we want to add all the elements one by one to the new list with the spread operator (...) and then add the selected meal
    }
  }

  final favoriteMealsProvider =
      StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
    return FavoriteMealsNotifier();
  });
}
