import 'package:flutter/material.dart';

import 'models/food_type.dart';
import 'models/meal_category.dart';

class GeneralData {
  static final categories = [
    MealCategory(
      category: MealCategoryEnum.breakfast,
      imageUri: 'assets/images/breakfast.jpg',
      title: 'Café da Manhã',
      color: Colors.blue,
      foodList: [
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Café',
          imageUri: 'assets/icons/coffeeCup.png',
        ),
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Chá',
          imageUri: 'assets/icons/teaCup.png',
        ),
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Café com Leite',
          imageUri: 'assets/icons/coffeeMilk.png',
        ),
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Achocolatado',
          imageUri: 'assets/icons/chocolateMilk.png',
        ),
        FoodType(
          type: FoodTypeEnum.cereals,
          title: 'Cereal',
          imageUri: 'assets/icons/cereals.png',
        ),
        FoodType(
          type: FoodTypeEnum.bread,
          title: 'Pão',
          imageUri: 'assets/icons/bread.png',
        ),
        FoodType(
          type: FoodTypeEnum.eggsAndCheese,
          title: 'Geléia',
          imageUri: 'assets/icons/jam.png',
        ),
        FoodType(
          type: FoodTypeEnum.bread,
          title: 'Misto',
          imageUri: 'assets/icons/cheeseSandwich.png',
        ),
        FoodType(
          type: FoodTypeEnum.cakeAndCookies,
          title: 'Bolo',
          imageUri: 'assets/icons/pieceOfCake.png',
        ),
        FoodType(
          type: FoodTypeEnum.cakeAndCookies,
          title: 'Biscoito',
          imageUri: 'assets/icons/cookie.png',
        ),
        FoodType(
          type: FoodTypeEnum.cakeAndCookies,
          title: 'Rosquinha',
          imageUri: 'assets/icons/donut.png',
        ),
        FoodType(
          type: FoodTypeEnum.eggsAndCheese,
          title: 'Ovos',
          imageUri: 'assets/icons/eggs.png',
        ),
        FoodType(
          type: FoodTypeEnum.eggsAndCheese,
          title: 'Queijo',
          imageUri: 'assets/icons/cheese.png',
        ),
        FoodType(
          type: FoodTypeEnum.fruit,
          title: 'Frutas',
          imageUri: 'assets/icons/fruit.png',
        ),
      ],
    ),
    MealCategory(
      category: MealCategoryEnum.lunch,
      imageUri: 'assets/images/lunch.jpg',
      title: 'Almoço',
      color: Colors.cyan,
      foodList: [
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Suco',
          imageUri: 'assets/icons/juice.png',
        ),
        FoodType(
          type: FoodTypeEnum.riceMassAndPotatos,
          title: 'Arroz',
          imageUri: 'assets/icons/rice.png',
        ),
        FoodType(
          type: FoodTypeEnum.beansAndSoup,
          title: 'Feijão',
          imageUri: 'assets/icons/beans.png',
        ),
        FoodType(
          type: FoodTypeEnum.beansAndSoup,
          title: 'Sopa',
          imageUri: 'assets/icons/soup.png',
        ),
        FoodType(
          type: FoodTypeEnum.riceMassAndPotatos,
          title: 'Macarrão',
          imageUri: 'assets/icons/spaghetti.png',
        ),
        FoodType(
          type: FoodTypeEnum.riceMassAndPotatos,
          title: 'Lasanha',
          imageUri: 'assets/icons/lasagna.png',
        ),
        FoodType(
          type: FoodTypeEnum.riceMassAndPotatos,
          title: 'Batata',
          imageUri: 'assets/icons/fries.png',
        ),
        FoodType(
          type: FoodTypeEnum.meat,
          title: 'Carne',
          imageUri: 'assets/icons/meat.png',
        ),
        FoodType(
          type: FoodTypeEnum.meat,
          title: 'Ovos',
          imageUri: 'assets/icons/eggs.png',
        ),
        FoodType(
          type: FoodTypeEnum.vegetables,
          title: 'Salada',
          imageUri: 'assets/icons/salad.png',
        ),
        FoodType(
          type: FoodTypeEnum.dessert,
          title: 'Sobremesa',
          imageUri: 'assets/icons/dessert.png',
        ),
      ],
    ),
    MealCategory(
      category: MealCategoryEnum.afternoonSnack,
      imageUri: 'assets/images/snack.jpg',
      title: 'Lanche da Tarde',
      color: Colors.deepOrange,
      foodList: [
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Bebidas',
          imageUri: 'assets/icons/juice.png',
        ),
        FoodType(
          type: FoodTypeEnum.cereals,
          title: 'Cereais',
          imageUri: 'assets/icons/cereals.png',
        ),
        FoodType(
          type: FoodTypeEnum.bread,
          title: 'Pães',
          imageUri: 'assets/icons/bread.png',
        ),
        FoodType(
          type: FoodTypeEnum.cakeAndCookies,
          title: 'Bolos e Biscoitos',
          imageUri: 'assets/icons/cookie.png',
        ),
        FoodType(
          type: FoodTypeEnum.eggsAndCheese,
          title: 'Ovos, Queijo e Requeijão',
          imageUri: 'assets/icons/eggs.png',
        ),
        FoodType(
          type: FoodTypeEnum.fruit,
          title: 'Frutas',
          imageUri: 'assets/icons/fruit.png',
        ),
      ],
    ),
    MealCategory(
      category: MealCategoryEnum.dinner,
      imageUri: 'assets/images/dinner.jpg',
      title: 'Jantar',
      color: Colors.pink,
      foodList: [
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Bebidas',
          imageUri: 'assets/icons/juice.png',
        ),
        FoodType(
          type: FoodTypeEnum.beansAndSoup,
          title: 'Feijão, Caldos e Sopas',
          imageUri: 'assets/icons/beans.png',
        ),
        FoodType(
          type: FoodTypeEnum.riceMassAndPotatos,
          title: 'Arroz, Massas e Batata',
          imageUri: 'assets/icons/rice.png',
        ),
        FoodType(
          type: FoodTypeEnum.meat,
          title: 'Carnes e Ovos',
          imageUri: 'assets/icons/meat.png',
        ),
        FoodType(
          type: FoodTypeEnum.vegetables,
          title: 'Legumes e Verduras',
          imageUri: 'assets/icons/vegetables.png',
        ),
        FoodType(
          type: FoodTypeEnum.dessert,
          title: 'Sobremesa',
          imageUri: 'assets/icons/dessert.png',
        ),
      ],
    ),
    MealCategory(
      category: MealCategoryEnum.miscelaneous,
      imageUri: 'assets/images/unhealthyFood.jpg',
      title: 'Outros',
      color: Colors.purple,
      foodList: [
        FoodType(
          type: FoodTypeEnum.drinks,
          title: 'Bebidas',
          imageUri: 'assets/icons/juice.png',
        ),
        FoodType(
          type: FoodTypeEnum.candies,
          title: 'Doces',
          imageUri: 'assets/icons/candy.png',
        ),
        FoodType(
          type: FoodTypeEnum.salties,
          title: 'Salgados',
          imageUri: 'assets/icons/burguer.png',
        ),
        FoodType(
          type: FoodTypeEnum.fruit,
          title: 'Frutas',
          imageUri: 'assets/icons/fruit.png',
        ),
      ],
    )
  ];
}
