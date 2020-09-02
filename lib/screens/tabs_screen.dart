import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/item_selection_grid.dart';

import '../models/diet_model.dart';
import '../utils/const_data.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  var title = 'Café da Manhã';
  DaylyDiet _diet;

  final _pages = [
    ItemSelectionGrid(
        MealCategoryEnum.breakfast, ConstData().foodItemsBreakfast),
    ItemSelectionGrid(MealCategoryEnum.lunch, ConstData().foodItemsLunch),
    ItemSelectionGrid(
        MealCategoryEnum.afternoonSnack, ConstData().foodItemsAfternoonSnack),
    ItemSelectionGrid(MealCategoryEnum.dinner, ConstData().foodItemsDinner),
    ItemSelectionGrid(MealCategoryEnum.extras, ConstData().foodItemsExtras),
  ];

  void _setTitle() {
    switch (_pages[_selectedPageIndex].mealCategory) {
      case MealCategoryEnum.breakfast:
        title = 'Café da Manhã';
        break;
      case MealCategoryEnum.lunch:
        title = 'Almoço';
        break;
      case MealCategoryEnum.afternoonSnack:
        title = 'Lanche da Tarde';
        break;
      case MealCategoryEnum.dinner:
        title = 'Jantar';
        break;
      case MealCategoryEnum.extras:
        title = 'Fora das Refeições';
        break;
    }
  }

  void _saveData() {}

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      _setTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.save),
                tooltip: 'Salvar',
                onPressed: () {
                  setState(() {
                    if (_selectedPageIndex == 4) {
                      // if (_pages[_selectedPageIndex].mealCategory ==
                      //     MealCategoryEnum.extras) {
                      _selectedPageIndex = 0;
                    } else {
                      _selectedPageIndex++;
                    }
                    _setTitle();
                  });
                },
              ),
              Text('Salvar'),
            ],
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        fixedColor: Colors.black,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/coffee.svg'),
            ),
            title: Text('Café'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/lunch.svg'),
            ),
            title: Text('Almoço'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/afternoonSnack.svg'),
            ),
            title: Text('Lanche'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/dinner.svg'),
            ),
            title: Text('Jantar'),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset('assets/svg/candy.svg'),
            ),
            title: Text('Extras'),
          ),
        ],
      ),
    );
  }
}
