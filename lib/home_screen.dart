import 'package:diet_and_teeth_app/diets_dashboard/ui/diets_screen.dart';
import 'package:diet_and_teeth_app/hygiene_dashboard/hygiene_screen.dart';
import 'package:diet_and_teeth_app/info_screen.dart';
import 'package:diet_and_teeth_app/medicines_dashboard/medicine_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    final _pages = _buildPages();
    return Scaffold(
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
