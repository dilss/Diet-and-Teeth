import 'package:flutter/material.dart';

class CarioFoodPage extends StatelessWidget {
  final String text =
      "Grupo de alimentos que permanecem aderidos na superfície dos dentes durante um período de tempo maior" +
          ", mesmo após a escovação, devido às características destes " +
          "alimentos. Devem ser evitados nos lanches e entre as refeições. " +
          "Exemplos: Biscoitos, caramelos, docinhos e guloseimas.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cariogênicos',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'KidsHandwriting',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.cyan[50],
          elevation: 8,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('assets/cario_food_imgs/img1.png'),
                      Image.asset('assets/cario_food_imgs/img2.png'),
                      Image.asset('assets/cario_food_imgs/img3.png'),
                      Image.asset('assets/cario_food_imgs/img4.png'),
                    ],
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
