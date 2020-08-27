import 'package:flutter/material.dart';

import '../widgets/food-pyramid.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = '/info-screen';
  final myAppBar = AppBar(
    title: Text('Informações'),
  );
  @override
  Widget build(BuildContext context) {
    final availableSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        myAppBar.preferredSize.height;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        alignment: Alignment.topCenter,
        height: availableSize,
        child: FoodPyramid(),
      ),
    );
  }
}
