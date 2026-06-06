import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});
@override
Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // text on the left
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('\$${food.price.toStringAsFixed(2)}',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                  SizedBox(height: 4),
                  Text(food.description,
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          // image on the right
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              food.imagePath,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    ),
  );
}
}