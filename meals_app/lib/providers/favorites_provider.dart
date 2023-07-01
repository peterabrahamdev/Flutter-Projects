import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    // We will return a bool data to know if a meal has been added to the favorites list or not, and with that information we can provide a snackbar message
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((m) => m.id != meal.id)
          .toList(); // If the meal is in the favorites and we toggle it off, then we only want to show those that have a different id (so we basically remove that item from the favorites list)
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; // If the meal isn't in the favorites, then we want to add all the elements one by one to the new list with the spread operator (...) and then add the selected meal
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
