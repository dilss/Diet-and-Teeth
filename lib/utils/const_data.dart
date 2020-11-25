import '../core/viewmodels/food_item_widget_model.dart';
import '../core/models/meal_category_enum.dart';
import '../core/models/food_item_category_enum.dart';

class IconsPath {
  static const beans = 'assets/icons/beans.png';
  static const biscuits = 'assets/icons/biscuits.png';
  static const bread = 'assets/icons/bread.png';
  static const burguer = 'assets/icons/burguer.png';
  static const candy = 'assets/icons/candy.png';
  static const cereals = 'assets/icons/cereals.png';
  static const cheese = 'assets/icons/cheese.png';
  static const cheeseSandwich = 'assets/icons/cheeseSandwich.png';
  static const chicken = 'assets/icons/chicken.png';
  static const chickenLeg = 'assets/icons/chickenLeg.png';
  static const chocolateMilk = 'assets/icons/chocolateMilk.png';
  static const coffeeCup = 'assets/icons/coffeeCup.png';
  static const coffeeMilk = 'assets/icons/coffeeMilk.png';
  static const cookie = 'assets/icons/cookie.png';
  static const donut = 'assets/icons/donut.png';
  static const eggs = 'assets/icons/eggs.png';
  static const fish = 'assets/icons/fish.png';
  static const fries = 'assets/icons/fries.png';
  static const fruit = 'assets/icons/fruit.png';
  static const icecream = 'assets/icons/icecream.png';
  static const jam = 'assets/icons/jam.png';
  static const juice = 'assets/icons/juice.png';
  static const juiceBox = 'assets/icons/juiceBox.png';
  static const lasagna = 'assets/icons/lasagna.png';
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
}

class ConstData {
  List<FoodItemWidgetModel> foodItemsBreakfast = [
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.cheeseSandwich,
      title: 'Misto',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.jam,
      title: 'Geléia',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  List<FoodItemWidgetModel> foodItemsLunch = [
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.lasagna,
      title: 'Lasanha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Macarrão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.salad,
      title: 'Salada',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Sobremesa bolo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Sobremesa pudim',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.icecream,
      title: 'Sobremesa sorvete',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Sobremesa Biscoito recheado',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Sobremesa Frutas',
    ),
  ];
  List<FoodItemWidgetModel> foodItemsAfternoonSnack = [
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.cheeseSandwich,
      title: 'Misto',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.jam,
      title: 'Geléia',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  List<FoodItemWidgetModel> foodItemsDinner = [
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.lasagna,
      title: 'Lasanha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Macarrão',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.salad,
      title: 'Salada',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Sobremesa bolo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Sobremesa pudim',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.icecream,
      title: 'Sobremesa sorvete',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Sobremesa Biscoito recheado',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Sobremesa Frutas',
    ),
  ];
  List<FoodItemWidgetModel> foodItemsExtras = [
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.burguer,
      title: 'Hamburguer',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batata',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.candy,
      title: 'Balas e doces',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Pudim',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Biscoito recheado',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.candy,
      title: 'Balas e doces',
    ),
    FoodItemWidgetModel(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
}
