import 'package:flutter/material.dart';

import '../models/food_type.dart';

class MealItem extends StatelessWidget {
  final itemIcon = Icons.favorite_border;
  final FoodType foodItem;

  MealItem(this.foodItem);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).primaryColor;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 6,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme, width: 5),
            gradient: LinearGradient(
              colors: [
                colorTheme.withOpacity(0.1),
                colorTheme.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Image.asset(foodItem.imageUri),
            title: Text(foodItem.title),
            trailing: IconButton(
              icon: Icon(itemIcon),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
