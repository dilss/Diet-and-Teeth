import 'package:diet_and_teeth_app/ui/screens/food_info_pages/food_info_grid_view.dart';
import 'package:diet_and_teeth_app/ui/screens/settings_pages/settings_grid_view.dart';
import 'package:flutter/material.dart';

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
              FoodInfoGridView(),
              Container(),
              SettingsGridView(),
            ],
          ),
        ),
      );
    });
  }
}
