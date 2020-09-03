import 'package:flutter/material.dart';

import '../models/widgets_models/food_item_widget_model.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItemWidgetModel _foodItem;

  FoodItemWidget(this._foodItem);

  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  final itemIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).primaryColor;
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget._foodItem.isSelected = !widget._foodItem.isSelected;
            });
          },
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 6,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: widget._foodItem.isSelected
                      ? Border.all(color: Colors.green, width: 5)
                      : Border.all(color: colorTheme, width: 5),
                  gradient: widget._foodItem.isSelected
                      ? LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.1),
                            Colors.green.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : LinearGradient(
                          colors: [
                            colorTheme.withOpacity(0.1),
                            colorTheme.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(widget._foodItem.iconPath),
                      height: constraint.maxHeight * 0.4,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      child: Text(
                        widget._foodItem.title,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
