import '../models/diet_model.dart';

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
  List<FoodItem> foodItemsBreakfast = [
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.cheeseSandwich,
      title: 'Misto',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.jam,
      title: 'Geléia',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.breakfast,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  List<FoodItem> foodItemsLunch = [
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.lasagna,
      title: 'Lasanha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Macarrão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.salad,
      title: 'Salada',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Sobremesa bolo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Sobremesa pudim',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.icecream,
      title: 'Sobremesa sorvete',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Sobremesa Biscoito recheado',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.lunch,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Sobremesa Frutas',
    ),
  ];
  List<FoodItem> foodItemsAfternoonSnack = [
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.coffeeCup,
      title: 'Café',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.teaCup,
      title: 'Chá',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.chocolateMilk,
      title: 'Achocolatado',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juice,
      title: 'Suco',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.bread,
      title: 'Pão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cereals,
      title: 'Cereal',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.cheeseSandwich,
      title: 'Misto',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.cheese,
      title: 'Queijo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.jam,
      title: 'Geléia',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.afternoonSnack,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
  List<FoodItem> foodItemsDinner = [
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.rice,
      title: 'Arroz',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.beans,
      title: 'Fejão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.soup,
      title: 'Sopa',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batatas',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.chickenLeg,
      title: 'Frango',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.meat,
      title: 'Carne vermelha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fish,
      title: 'Peixe',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.eggs,
      title: 'Ovos',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.lasagna,
      title: 'Lasanha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.spaghetti,
      title: 'Macarrão',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.salad,
      title: 'Salada',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Sobremesa bolo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Sobremesa pudim',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.icecream,
      title: 'Sobremesa sorvete',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.dessertWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Sobremesa Biscoito recheado',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.dinner,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Sobremesa Frutas',
    ),
  ];
  List<FoodItem> foodItemsExtras = [
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.breadCookieWithoutSugar,
      iconPath: IconsPath.burguer,
      title: 'Hamburguer',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.ricePastaAndPotato,
      iconPath: IconsPath.fries,
      title: 'Batata',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.soda,
      title: 'Refrigerante',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.drinksWithSugar,
      iconPath: IconsPath.juiceBox,
      title: 'Suco',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.candy,
      title: 'Balas e doces',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pieceOfCake,
      title: 'Bolo',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.pudding,
      title: 'Pudim',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.donut,
      title: 'Rosquinha',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.cookie,
      title: 'Biscoito',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.cakeCookieWithSugar,
      iconPath: IconsPath.biscuits,
      title: 'Biscoito recheado',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.stickyCandies,
      iconPath: IconsPath.candy,
      title: 'Balas e doces',
    ),
    FoodItem(
      mealCategory: MealCategoryEnum.extras,
      foodItemCategory: FoodItemCategoryEnum.harmlessFood,
      iconPath: IconsPath.fruit,
      title: 'Frutas',
    ),
  ];
}
