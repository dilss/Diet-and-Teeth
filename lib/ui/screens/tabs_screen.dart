import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';
import '../../core/models/daily_diet_data.dart';

import '../widgets/item_selection_grid.dart';

import '../../core/models/meal_category_enum.dart';
import '../widgets/success_check.dart';
import '../../utils/const_data.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _bottomSelectedPageIndex = 0;
  var label = 'Café da Manhã';
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
        label = 'Café da Manhã';
        break;
      case MealCategoryEnum.lunch:
        label = 'Almoço';
        break;
      case MealCategoryEnum.afternoonSnack:
        label = 'Lanche da Tarde';
        break;
      case MealCategoryEnum.dinner:
        label = 'Jantar';
        break;
      case MealCategoryEnum.extras:
        label = 'Fora das Refeições';
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

  void _showCheckSuccessAndReturnToInicialScreen(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => SimpleDialog(
        children: [
          SuccessCheckMark(),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Salvo com sucesso!',
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> _saveDietInDatabase(DailyDiet diet) async {
    final database = Provider.of<Database>(context, listen: false);
    await database.setDiet(diet);
  }

  @override
  Widget build(BuildContext context) {
    var diet = Provider.of<DailyDiet>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          diet.date,
        ),
        bottom: PreferredSize(
          child: Text(
            label,
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
                  DailyDiet daylyDiet = DailyDiet(date: diet.date);
                  diet.items.forEach((element) {
                    daylyDiet.addItem(element);
                  });
                  print(daylyDiet.date);
                  print(
                    daylyDiet.toMap(),
                  );
                  _saveDietInDatabase(daylyDiet);
                  diet = null;
                  _showCheckSuccessAndReturnToInicialScreen(context);
                  final database =
                      Provider.of<Database>(context, listen: false);
                  print(
                      '----------------------READ DIETS---------------------------');
                  database.dietsStream();
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
        fixedColor: Colors.black,
        currentIndex: _bottomSelectedPageIndex,
        onTap: (value) {
          _bottomTaped(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/coffee.svg',
                height: 40,
              ),
            ),
            label: 'Café',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/lunch.svg',
                height: 40,
              ),
            ),
            label: 'Almoço',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/afternoonSnack.svg',
                height: 40,
              ),
            ),
            label: 'Lanche',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/dinner.svg',
                height: 40,
              ),
            ),
            label: 'Jantar',
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/candy.svg',
                height: 40,
              ),
            ),
            label: 'Extras',
          ),
        ],
      ),
    );
  }
}