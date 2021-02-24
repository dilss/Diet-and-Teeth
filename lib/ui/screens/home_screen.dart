import 'package:diet_and_teeth_app/core/services/auth.dart';
import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:diet_and_teeth_app/ui/screens/diets_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/hygiene_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/info_screen.dart';
import 'package:diet_and_teeth_app/ui/screens/medicine_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  String title = 'Suas Dietas';
  List<Map<String, Object>> _buildPages() {
    return [
      {'page': DietsScreen(), 'title': title},
      {'page': HygieneScreen(), 'title': 'Higiene Bucal'},
      {'page': MedicineScreen(), 'title': 'Medicamentos'},
      {'page': InfoScreen(), 'title': 'Informações'},
    ];
  }

  void _bottomTaped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthBase>(context, listen: false);
    final _database = Provider.of<Database>(context, listen: false);
    final _pages = _buildPages();

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
            stream: _database.usernameStream(),
            initialData: "Suas Dietas",
            builder: (context, snapshot) {
              return Text(
                _selectedPageIndex == 0
                    ? "Dietas de ${snapshot.data}"
                    : _pages[_selectedPageIndex]['title'],
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'KidsHandwriting',
                ),
              );
            }),
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
                    _auth.signOut();
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
              child: SvgPicture.asset('assets/svg/toothbrushAndToothpaste.svg'),
            ),
            label: 'Higiene',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/syrup.svg'),
            ),
            label: 'Medicamentos',
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
