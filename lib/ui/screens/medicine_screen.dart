import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  static const routeName = '/medicine';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableSize = constraints.maxHeight;
      return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: availableSize * 0.01),
              Container(
                height: availableSize * 0.38,
                child: Card(
                  elevation: 8,
                  shadowColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: availableSize * 0.01),
              Container(
                height: availableSize * 0.6,
                child: Card(
                  elevation: 8,
                  shadowColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListView(),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
