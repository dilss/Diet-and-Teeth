import 'package:diet_and_teeth_app/admin_dashboard/search_patient_page.dart';
import 'package:diet_and_teeth_app/food_info_pages/food_info_grid_view.dart';
import 'package:diet_and_teeth_app/general_use_widgets/logout_confirmation_dialog.dart';
import 'package:diet_and_teeth_app/settings_pages/settings_grid_view.dart';
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
            actions: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: FlatButton(
                  splashColor: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => LogoutConfirmationDialog(
                      title: 'Deseja mesmo sair?',
                    ),
                  ),
                ),
              ),
            ],
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
              SearchPatient(),
              SettingsGridView(),
            ],
          ),
        ),
      );
    });
  }
}
