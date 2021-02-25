import 'package:flutter/material.dart';

class NoCarioFoodPage extends StatelessWidget {
  final String text = "Grupo de alimentos que não se aderem" +
      " facilmente a superfície dos dentes. Podem auxiliar na " +
      "limpeza da cavidade bucal por meio da mastigação e da estimulação da produção de saliva." +
      "Exemplos: Carnes, frangos, peixes, ovos, legumes, verduras, frutas e gorduras.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Não Cariogênicos',
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
                      Image.asset('assets/not_cario_food_imgs/img1.png'),
                      Image.asset('assets/not_cario_food_imgs/img2.png'),
                      Image.asset('assets/not_cario_food_imgs/img3.png'),
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
