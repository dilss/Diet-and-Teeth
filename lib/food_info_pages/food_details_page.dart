import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  final String text;
  final String pageTitle;
  final String title;
  final List<String> imagePaths;

  FoodDetailsPage({
    @required this.title,
    @required this.pageTitle,
    @required this.text,
    @required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: imagePaths.length > 1 ? 2 : 1,
                      childAspectRatio: imagePaths.length > 1 ? 2 : 1,
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        imagePaths[index],
                      );
                    },
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
      ),
    );
  }
}
