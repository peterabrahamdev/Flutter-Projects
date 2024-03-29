import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final Function() onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1, meal.complexity.name.length);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip
            .hardEdge, // The Stack widget won't take the shape into consideration, therefore we have to force it
        elevation: 2,
        child: InkWell(
            onTap: onSelectMeal,
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit
                      .cover, // It will crop the image instead of distorting it
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 44),
                      child: Column(
                        children: [
                          Text(
                            meal.title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MealItemTrait(
                                    icon: Icons.schedule,
                                    label: '${meal.duration} min'),
                                const SizedBox(
                                  width: 12,
                                ),
                                MealItemTrait(
                                    icon: Icons.work, label: complexityText),
                                const SizedBox(
                                  width: 12,
                                ),
                                MealItemTrait(
                                    icon: Icons.attach_money,
                                    label: meal.affordability.name),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )));
  }
}
