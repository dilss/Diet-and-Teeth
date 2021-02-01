import 'package:diet_and_teeth_app/ui/widgets/food-pyramid.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = '/info-screen';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableSize = constraints.maxHeight;
      return Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          height: availableSize,
          child: FoodPyramid(),
        ),
      );
    });
  }
}
