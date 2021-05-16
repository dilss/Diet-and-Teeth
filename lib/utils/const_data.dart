import 'package:diet_and_teeth_app/diets_dashboard/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/food_item_category_enum.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/food_item_id_enum.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/food_item_widget_model.dart';
import 'package:diet_and_teeth_app/diets_dashboard/models/meal_category_enum.dart';

class IconsPath {
  static const beans = 'assets/icons/beans.png';
  static const biscuits = 'assets/icons/biscuits.png';
  static const bread = 'assets/icons/bread.png';
  static const burguer = 'assets/icons/burguer.png';
  static const candy = 'assets/icons/candy.png';
  static const cereals = 'assets/icons/cereals.png';
  static const cheese = 'assets/icons/cheese.png';
  static const chicken = 'assets/icons/chicken.png';
  static const chickenLeg = 'assets/icons/chickenLeg.png';
  static const chocolateMilk = 'assets/icons/chocolateMilk.png';
  static const coffeeCup = 'assets/icons/coffeeCup.png';
  static const coffeeMilk = 'assets/icons/coffeeMilk.png';
  static const cookie = 'assets/icons/cookie.png';
  static const eggs = 'assets/icons/eggs.png';
  static const fish = 'assets/icons/fish.png';
  static const fries = 'assets/icons/fries.png';
  static const fruit = 'assets/icons/fruit.png';
  static const icecream = 'assets/icons/icecream.png';
  static const juice = 'assets/icons/juice.png';
  static const meat = 'assets/icons/meat.png';
  static const pieceOfCake = 'assets/icons/pieceOfCake.png';
  static const pudding = 'assets/icons/pudding.png';
  static const rice = 'assets/icons/rice.png';
  static const salad = 'assets/icons/salad.png';
  static const soda = 'assets/icons/soda.png';
  static const soup = 'assets/icons/soup.png';
  static const spaghetti = 'assets/icons/spaghetti.png';
  static const teaCup = 'assets/icons/teaCup.png';
  static const vegetables = 'assets/icons/vegetables.png';
  static const honeyJar = 'assets/icons/honey.png';
  static const pastry = 'assets/icons/pastry.png';
  static const guaravita = 'assets/icons/guaravita.png';
  static const yougurt = 'assets/icons/yogurt.png';
}

class ConstData {
  static List<FoodItemWidgetModel> foodItemsBreakfast = [
    FoodItemWidgetModel(
      id: FoodItemId.breakfastCoffee,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastTea,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastChocolate,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastJuice,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastJuice,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.guaravita,
      title: 'Guaraná Natural',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastYogurt,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.yougurt,
      title: 'Iogurte',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastBread,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastPastry,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.pastry,
      title: 'Salgado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastCookie,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastCake,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastHoneyJar,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.honeyJar,
      title: 'Mel',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastCereal,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastCheese,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastEggs,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.breakfastFruit,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  static List<FoodItemWidgetModel> foodItemsLunch = [
    FoodItemWidgetModel(
      id: FoodItemId.lunchJuice,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchSoda,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchRice,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchBeans,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchSoup,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa/Caldo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchFries,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchChicken,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchRedMeat,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchFish,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchEggs,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchSpaghetti,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Massas',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchSalad,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.vegetables,
      title: 'Vegetais',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchBurguer,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.burguer,
      title: 'Sanduíche',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchCake,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Doces',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.lunchFruit,
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  static List<FoodItemWidgetModel> foodItemsAfternoonSnack = [
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackCoffee,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackTea,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackChocolate,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackJuice,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackGuarana,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.guaravita,
      title: 'Guaraná Natural',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackYogurt,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.yougurt,
      title: 'Iogurte',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackBread,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackPastry,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.pastry,
      title: 'Salgado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackCookie,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackCake,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackHoneyJar,
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.honeyJar,
      title: 'Mel',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackCereal,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackCheese,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackEggs,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.afternoonSnackFruit,
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  static List<FoodItemWidgetModel> foodItemsDinner = [
    FoodItemWidgetModel(
      id: FoodItemId.dinnerJuice,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerSoda,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerRice,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerBeans,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerSoup,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerFries,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerChicken,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerRedMeat,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerFish,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerEggs,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerSpaghetti,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Massas',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerSalad,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.vegetables,
      title: 'Vegetais',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerBurguer,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.burguer,
      title: 'Sanduíche',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerCake,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Doces',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.dinnerFruit,
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  static List<FoodItemWidgetModel> foodItemsExtras = [
    FoodItemWidgetModel(
      id: FoodItemId.extrasBurguer,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.burguer,
      title: 'Sanduíche',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasPastry,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.pastry,
      title: 'Salgado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasFries,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batata',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasSoda,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasChocolate,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasJuice,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasGuarana,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.guaravita,
      title: 'Guaraná Natural',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasYogurt,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.yougurt,
      title: 'Iogurte',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasCandy,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.candy,
      title: 'Balas e doces',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasCake,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasPudding,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Pudim',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasHoneyJar,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.honeyJar,
      title: 'Mel',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasCookie,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasStuffedCookie,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Biscoito recheado',
    ),
    FoodItemWidgetModel(
      id: FoodItemId.extrasFruit,
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];

  static void _setSelected(List<FoodItemWidgetModel> list, DailyDiet diet) {
    diet.items.forEach(
      (dataElement) {
        final index = list
            .indexWhere((widgetElement) => dataElement.id == widgetElement.id);
        if (index != -1) {
          list[index].isSelected = true;
        }
      },
    );
  }

  static void setSelectedItems(DailyDiet diet) {
    _setSelected(foodItemsBreakfast, diet);
    _setSelected(foodItemsLunch, diet);
    _setSelected(foodItemsAfternoonSnack, diet);
    _setSelected(foodItemsDinner, diet);
    _setSelected(foodItemsExtras, diet);
  }

  static void _resetSelected(List<FoodItemWidgetModel> list) {
    list.forEach(
      (element) {
        element.isSelected = false;
      },
    );
  }

  static void resetSelectedItems() {
    _resetSelected(foodItemsBreakfast);
    _resetSelected(foodItemsLunch);
    _resetSelected(foodItemsAfternoonSnack);
    _resetSelected(foodItemsDinner);
    _resetSelected(foodItemsExtras);
  }
}

class FoodInfo {
  static String carioFoodText =
      "São alimentos que permanecem aderidos na superfície dos dentes durante um período de tempo maior" +
          ", mesmo após a escovação, devido às características destes " +
          "alimentos. Devem ser evitados nos lanches e entre as refeições. " +
          "Exemplos: Biscoitos, caramelos, docinhos e guloseimas.";

  static String nonCarioFoodText = "São alimentos que não se aderem" +
      " facilmente a superfície dos dentes. Podem auxiliar na " +
      "limpeza da cavidade bucal por meio da mastigação e da estimulação da produção de saliva." +
      "Exemplos: Carnes, frangos, peixes, ovos, legumes, verduras, frutas e gorduras.";

  static String cerealsBreadPastaTubersText =
      'São alimentos ricos em carboidratos que fornecem energia para o nosso corpo.' +
          'Podem ser refinados, como o arroz branco, farinha de trigo, pão francês, macarrão ou podem ser integrais, que são mais' +
          ' nutritivos, como o arroz integral, farinha de trigo integral, pão integral, macarrão integral, milho, além dos tubérculos' +
          ' como as batatas, inhame e mandioca.';

  static String vegetablesText =
      'São alimentos que fornecem nutrientes como vitaminas e minerais. Além disso, são fontes de fibras,' +
          ' fundamentais para o adequado funcionamento do intestino e fontes de compostos bioativos, substâncias que contribuem para' +
          ' a prevenção de muitas doenças. Alguns exemplos: alface, agrião, abóbora, beterraba, brócolis, cenoura, chuchu,' +
          ' couve-flor e espinafre.';

  static String fruitsText =
      'São alimentos que fornecem nutrientes como vitaminas e minerais. Além disso, são fontes de fibras,' +
          ' fundamentais para o bom funcionamento do intestino e fontes de compostos bioativos, substâncias que contribuem ' +
          'para a prevenção de muitas doenças. Alguns exemplos: abacate, banana, maçã, mamão, manga, laranja, tangerina e uva.';

  static String legumesText =
      'São alimentos fontes de proteína de origem vegetal, importante para a construção ' +
          'de músculos, além de carboidratos, fibras e compostos bioativos. Alguns exemplos são os feijões, ervilha,' +
          ' lentilha, grão-de-bico e soja.';

  static String oilseedsText =
      'São alimentos ricos em vitaminas, minerais, fibras, gorduras de origem vegetal ' +
          '(que são mais saudáveis) e compostos bioativos. Alguns exemplos: castanhas, nozes, amêndoas e amendoim.';

  static String meatAndEggsText =
      'São alimentos ricos em proteína de origem animal, importantes para a construção' +
          ' de músculos, além de alguns minerais como ferro e zinco, importantes para a formação das células do sangue' +
          ' e para o bom funcionamento do sistema imunológico. Alguns exemplos do grupo das carnes e ovos: carne bovina,' +
          ' carne suína, aves, peixes e ovos.';

  static String milkAndDairyProductsText =
      'são alimentos ricos em proteínas de origem animal e minerais como cálcio, ' +
          'importante para a saúde dos ossos. Alguns exemplos: leites, iogurtes, coalhadas e queijos.';

  static String oilsAndFatsText =
      'São alimentos calóricos que fornecem energia para o nosso organismo. ' +
          'Desde que utilizados com moderação para temperar e cozinhar os alimentos, contribuem' +
          ' para diversificar e tornar mais saborosa a alimentação sem torná-la nutricionalmente' +
          ' desbalanceada ou muito calórica. Alguns exemplos: óleos vegetais, azeite e manteiga.';

  static String sugarAndCandyText =
      'São alimentos ricos em "calorias vazias", pois fornecem energia para o nosso organismo, mas nenhum' +
          ' tipo de nutriente, por isso, devem ser evitados. Alguns exemplos: balas, pirulitos, chocolates,' +
          ' sorvetes e doces cremosos.';
}
