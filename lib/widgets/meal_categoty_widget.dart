import 'package:flutter/material.dart';

import '../models/meal_category.dart';
import '../screens/item_selection_screen.dart';

class MealCategoryWidget extends StatelessWidget {
  final MealCategory _category;

  MealCategoryWidget(this._category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ItemSelectionScreen.routeName, arguments: _category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            _category.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 5),
          image: DecorationImage(
            image: AssetImage(_category.imageUri),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
