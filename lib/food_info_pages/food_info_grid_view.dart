import 'package:diet_and_teeth_app/utils/const_data.dart';
import 'package:flutter/material.dart';

import 'food_details_page.dart';
import 'grid_item.dart';

class FoodInfoGridView extends StatelessWidget {
  const FoodInfoGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tipos de Alimentos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
              ),
              padding: EdgeInsets.all(8),
              children: [
                GridItem(
                  color: Colors.green,
                  text: 'Alimentos não cariogênicos',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Tipos de Alimentos',
                          title: "Alimentos não cariogênicos",
                          text: FoodInfo.nonCarioFoodText,
                          imagePaths: [
                            'assets/food_images/not_cario_food_imgs/img1.png',
                            'assets/food_images/not_cario_food_imgs/img2.png',
                            'assets/food_images/not_cario_food_imgs/img3.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  color: Colors.red,
                  text: 'Alimentos cariogênicos',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Tipos de Alimentos',
                          title: "Alimentos cariogênicos",
                          text: FoodInfo.nonCarioFoodText,
                          imagePaths: [
                            'assets/food_images/cario_food_imgs/img1.png',
                            'assets/food_images/cario_food_imgs/img2.png',
                            'assets/food_images/cario_food_imgs/img3.png',
                            'assets/food_images/cario_food_imgs/img4.png'
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/unhealthy_food.svg',
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Grupos Alimentares',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1,
              ),
              padding: EdgeInsets.all(8),
              children: [
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(238, 192, 123, 1),
                  text: 'Cereais, pães, massas e tubérculos',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: "Cereais, pães, massas e tubérculos",
                          text: FoodInfo.cerealsBreadPastaTubersText,
                          imagePaths: [
                            'assets/food_images/cereals_and_bread/breads.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/unhealthy_food.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(69, 125, 0, 1),
                  text: 'Legumes e verduras',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Legumes e verduras',
                          text: FoodInfo.vegetablesText,
                          imagePaths: [
                            'assets/food_images/vegetables/vegetables.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(219, 56, 122, 1),
                  text: 'Frutas',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Frutas',
                          text: FoodInfo.fruitsText,
                          imagePaths: [
                            'assets/food_images/fruits/fruits.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(124, 63, 0, 1),
                  text: 'Leguminosas',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Leguminosas',
                          text: FoodInfo.legumesText,
                          imagePaths: [
                            'assets/food_images/legumes/legumes.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(222, 199, 171, 1),
                  text: 'Oleaginosas',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Oleaginosas',
                          text: FoodInfo.oilseedsText,
                          imagePaths: [],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(161, 104, 104, 1),
                  text: 'Carnes e ovos',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Carnes e ovos',
                          text: FoodInfo.meatAndEggsText,
                          imagePaths: [
                            'assets/food_images/meat_and_eggs/fish.png',
                            'assets/food_images/meat_and_eggs/meat.png',
                            'assets/food_images/meat_and_eggs/egg.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(251, 190, 0, 1),
                  text: 'Leite e derivados',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Leite e derivados',
                          text: FoodInfo.milkAndDairyProductsText,
                          imagePaths: [
                            'assets/food_images/milk_and_dairy_products/milk_and_dairy_products.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(142, 176, 39, 1),
                  text: 'Óleos e gorduras',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Óleos e gorduras',
                          text: FoodInfo.oilsAndFatsText,
                          imagePaths: [
                            'assets/food_images/oils_and_fats/olive_oil.png',
                            'assets/food_images/oils_and_fats/butter.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
                GridItem(
                  fontSize: 12,
                  color: Color.fromRGBO(53, 226, 195, 1),
                  text: 'Açúcares e doces',
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsPage(
                          pageTitle: 'Grupos Alimentares',
                          title: 'Açúcares e doces',
                          text: FoodInfo.sugarAndCandyText,
                          imagePaths: [
                            'assets/food_images/sugar_and_candy/candy.png',
                          ],
                        ),
                      ),
                    );
                  },
                  imgPath: 'assets/flat_icon/healthy_diet.svg',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
