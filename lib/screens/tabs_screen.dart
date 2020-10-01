import 'package:diet_and_teeth_app/providers/dayly_diet_data_provider.dart';
import 'package:diet_and_teeth_app/providers/diets_list_provider.dart';
import 'package:diet_and_teeth_app/widgets/dayly_diet_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widgets/item_selection_grid.dart';

import '../models/types/meal_category_enum.dart';
import '../utils/const_data.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _bottomSelectedPageIndex = 0;
  var title = 'Café da Manhã';
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final _pages = [
    ItemSelectionGrid(
        MealCategoryEnum.breakfast, ConstData().foodItemsBreakfast),
    ItemSelectionGrid(MealCategoryEnum.lunch, ConstData().foodItemsLunch),
    ItemSelectionGrid(
        MealCategoryEnum.afternoonSnack, ConstData().foodItemsAfternoonSnack),
    ItemSelectionGrid(MealCategoryEnum.dinner, ConstData().foodItemsDinner),
    ItemSelectionGrid(MealCategoryEnum.extras, ConstData().foodItemsExtras),
  ];

  void _pageChanged(int index) {
    setState(() {
      _bottomSelectedPageIndex = index;
    });
  }

  void _setTitle() {
    switch (_pages[_bottomSelectedPageIndex].mealCategory) {
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

  void _bottomTaped(int index) {
    setState(() {
      _bottomSelectedPageIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      _setTitle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;
    DietsListProvider _list = Provider.of<DietsListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs.toString(),
        ),
        bottom: PreferredSize(
          child: Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(16),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.save),
                tooltip: 'Salvar',
                onPressed: () {
                  _list.addDaylyDiet(
                    DaylyDietProvider(
                      date: DateTime.now(),
                    ),
                  );
                },
              ),
              Text('Salvar'),
            ],
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [..._pages],
        onPageChanged: (value) {
          _pageChanged(value);
          _setTitle();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        fixedColor: Colors.black,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        currentIndex: _bottomSelectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _bottomTaped(value);
        },
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
