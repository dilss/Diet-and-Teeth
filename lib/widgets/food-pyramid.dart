import 'package:flutter/material.dart';

class FoodPyramid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        return Container(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/foodPyramid.png',
                fit: BoxFit.contain,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.black38,
                    height: contraints.maxHeight * 0.25,
                  ),
                  Container(
                    color: Colors.blue.withOpacity(0.38),
                    height: contraints.maxHeight * 0.25,
                  ),
                  Container(
                    color: Colors.green.withOpacity(0.38),
                    height: contraints.maxHeight * 0.25,
                  ),
                  Container(
                    color: Colors.orange.withOpacity(0.38),
                    height: contraints.maxHeight * 0.25,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
