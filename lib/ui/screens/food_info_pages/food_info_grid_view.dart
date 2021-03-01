import 'package:diet_and_teeth_app/ui/screens/food_info_pages/cario_food_info.dart';
import 'package:diet_and_teeth_app/ui/screens/food_info_pages/grid_item.dart';
import 'package:diet_and_teeth_app/ui/screens/food_info_pages/no_cario_food_info.dart';
import 'package:flutter/material.dart';

class FoodInfoGridView extends StatelessWidget {
  const FoodInfoGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
      ),
      children: [
        GridItem(
          color: Colors.green,
          text: "Alimentos não cariogênicos",
          callBack: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NoCarioFoodPage()));
          },
          imgPath: 'assets/flat_icon/healthy_diet.svg',
        ),
        GridItem(
          color: Colors.red,
          text: "Alimentos cariogênicos",
          callBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CarioFoodPage()));
          },
          imgPath: 'assets/flat_icon/unhealthy_food.svg',
        )
      ],
    );
  }
}
