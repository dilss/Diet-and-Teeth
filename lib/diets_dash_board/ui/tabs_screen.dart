import 'package:connectivity/connectivity.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/meal_category_enum.dart';
import 'package:diet_and_teeth_app/diets_dash_board/ui/item_selection_grid.dart';
import 'package:diet_and_teeth_app/diets_dash_board/ui/success_check.dart';
import 'package:diet_and_teeth_app/services/database.dart';
import 'package:diet_and_teeth_app/utils/const_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/svg.dart';

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

  void _bottomTaped(int index) {
    setState(() {
      _bottomSelectedPageIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      _setTitle();
    });
  }

  void _showCheckSuccessAndReturnToInicialScreen() {
    showDialog(
      context: context,
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
    final connectivity = Provider.of<Connectivity>(context, listen: false);
    final database = Provider.of<Database>(context, listen: false);

    final status = await connectivity.checkConnectivity();
    switch (status) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        try {
          await database.setDiet(diet);
          ConstData.resetSelectedItems();
          _showCheckSuccessAndReturnToInicialScreen();
        } catch (e) {
          rethrow;
        }
        break;
      case ConnectivityResult.none:
        _showErrorDialog("Erro: Sem conexão com a internet!");
        break;
      default:
        _showErrorDialog("Um erro ocorreu.");
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
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title),
          actions: [
            FlatButton(
              child: Text('Sim'),
              onPressed: () {
                ConstData.resetSelectedItems();
                diet.clearData();
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => SimpleDialog(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Image.asset("assets/images/error.png"),
              height: 100,
              width: 100,
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          errorMessage,
          style: TextStyle(fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var diet = Provider.of<DailyDiet>(context, listen: false);
    return WillPopScope(
      onWillPop: _onWillPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: widget.isEditMode
              ? Text(
                  widget.diet.date + ' Edição',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
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
                    onPressed: () async {
                      try {
                        await _saveDietInDatabase(diet);
                      } catch (e) {
                        _showErrorDialog("Erro desconehcido.");
                      }
                    }),
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
      ),
    );
  }
}
