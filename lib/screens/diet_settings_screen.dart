import 'package:flutter/material.dart';

import '../widgets/meal_categoty_widget.dart';
import '../data.dart';

class DietSettingsScreen extends StatelessWidget {
  final myAppBar = AppBar(
    title: Text('Refeições'),
  );

  static const routeName = '/diet-settings-screen';
  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: GeneralData.categories.map((mealCategory) {
            return Container(
              height: availableSize * 0.19,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: MealCategoryWidget(mealCategory),
            );
          }).toList(),
        ),
      ),
    );
  }
}
