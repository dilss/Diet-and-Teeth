import 'package:diet_and_teeth_app/screens/medicine_screen.dart';
import 'package:flutter/material.dart';

import 'drawer_header_content.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final globalColor = Theme.of(context).primaryColor;
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: globalColor),
            child: DrawerHeaderContent(),
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text(
              'Medicamentos',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(MedicineScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              'Informações',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text(
              'Relatórios',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Configurações',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
