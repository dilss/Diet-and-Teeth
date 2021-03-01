import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:diet_and_teeth_app/ui/screens/food_info_pages/grid_item.dart';
import 'package:diet_and_teeth_app/ui/screens/settings_pages/colophon_page.dart';
import 'package:diet_and_teeth_app/ui/screens/settings_pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1,
      ),
      children: [
        GridItem(
          color: Colors.blue.shade200,
          text: "Editar perfil",
          callBack: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    Provider<Database>.value(value: _database),
                  ],
                  child: EditProfilePage(),
                ),
              ),
            );
          },
          imgPath: 'assets/flat_icon/edit_profile.svg',
        ),
        GridItem(
          color: Colors.orange.shade200,
          text: "Colofão",
          callBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ColophonPage()));
          },
          imgPath: 'assets/svg/information.svg',
        )
      ],
    );
  }
}
