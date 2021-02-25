import 'package:diet_and_teeth_app/ui/screens/food_info_pages/grid_item.dart';
import 'package:diet_and_teeth_app/ui/screens/food_info_pages/no_cario_food_info.dart';
import 'package:flutter/material.dart';

import 'food_info_pages/cario_food_info.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = '/info-screen';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Informações',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'KidsHandwriting',
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.fastfood_rounded,
                  size: 35,
                )),
                Tab(
                    icon: Icon(
                  Icons.admin_panel_settings_rounded,
                  size: 35,
                )),
                Tab(
                    icon: Icon(
                  Icons.settings_rounded,
                  size: 35,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                ),
                children: [
                  GridItem(
                    color: Colors.green,
                    text: "Alimentos não cariogênicos",
                    callBack: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NoCarioFoodPage()));
                    },
                    imgPath: 'assets/flat_icon/healthy_diet.svg',
                  ),
                  GridItem(
                    color: Colors.red,
                    text: "Alimentos cariogênicos",
                    callBack: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CarioFoodPage()));
                    },
                    imgPath: 'assets/flat_icon/unhealthy_food.svg',
                  )
                ],
              ),
              Container(),
              Container(),
            ],
          ),
        ),
      );
    });
  }
}
