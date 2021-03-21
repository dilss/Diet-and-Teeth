import 'package:diet_and_teeth_app/diets_dashboard/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/meal_category_enum.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/item_selection_grid.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/main_bottom_navigation.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/on_will_pop_dialog.dart';
import 'package:diet_and_teeth_app/diets_dashboard/ui/tabs_page_app_bar.dart';
import 'package:diet_and_teeth_app/utils/const_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  final bool isEditMode;
  final DailyDiet diet;

  TabsScreen({this.isEditMode = false, this.diet}) {
    if (isEditMode) {
      ConstData.setSelectedItems(diet);
    }
  }

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
    ItemSelectionGrid(MealCategoryEnum.breakfast, ConstData.foodItemsBreakfast),
    ItemSelectionGrid(MealCategoryEnum.lunch, ConstData.foodItemsLunch),
    ItemSelectionGrid(
        MealCategoryEnum.afternoonSnack, ConstData.foodItemsAfternoonSnack),
    ItemSelectionGrid(MealCategoryEnum.dinner, ConstData.foodItemsDinner),
    ItemSelectionGrid(MealCategoryEnum.extras, ConstData.foodItemsExtras),
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

  Future<bool> _onWillPopCallback() async {
    var diet = Provider.of<DailyDiet>(context, listen: false);
    if (widget.isEditMode) {
      return _onWillPopDialog(diet: diet);
    }

    if (!widget.isEditMode && diet.items.isEmpty) {
      return true;
    }
    return await _onWillPopDialog(
        diet: diet, title: 'Descartar Dieta em andamento?');
  }

  Future<bool> _onWillPopDialog({
    DailyDiet diet,
    String title = 'Abandonar edição de dieta?',
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return OnWillPopDialog(
          title: title,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final date = Provider.of<DailyDiet>(context, listen: false).date;
    return WillPopScope(
      onWillPop: _onWillPopCallback,
      child: Scaffold(
          appBar: getTabsPageAppBar(
            context: context,
            title: date,
            appBarBottomText: label,
            isEditMode: widget.isEditMode,
          ),
          body: PageView(
            controller: _pageController,
            children: [..._pages],
            onPageChanged: (value) {
              _pageChanged(value);
              _setTitle();
            },
          ),
          bottomNavigationBar: MainBottomNavigationBar(
            pageController: _pageController,
            changePageTitle: _setTitle,
            bottomCurrentIndex: _bottomSelectedPageIndex,
          )),
    );
  }
}
