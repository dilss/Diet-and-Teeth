import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import 'diets_screen.dart';
import 'hygiene_screen.dart';
import 'medicine_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final List<Map<String, Object>> _pages = [
    {'page': DietsScreen(), 'title': 'Suas Dietas'},
    {'page': HygieneScreen(), 'title': 'Higiene Bucal'},
    {'page': MedicineScreen(), 'title': 'Seus Remédios'},
    {'page': InfoScreen(), 'title': 'Informações'},
  ];

  void _bottomTaped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Sair'),
                        ],
                      ),
                    ),
                    value: 'logout',
                  ),
                ],
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onChanged: (itemIdentifier) {
                  if (itemIdentifier == 'logout') {
                    FirebaseAuth.instance.signOut();
                  }
                }),
          )
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _bottomTaped,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/healthyFood.svg'),
            ),
            label: 'Dietas',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/toothbrushAndToothPaste.svg'),
            ),
            label: 'Higiene',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/syrup.svg'),
            ),
            label: 'Remédios',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/information.svg'),
            ),
            label: 'Informações',
          ),
        ],
      ),
    );
  }
}
