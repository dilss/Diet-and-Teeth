import 'package:diet_and_teeth_app/diets_dash_board/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/food_item_data_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board/models/food_item_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItemWidgetModel _foodItem;

  FoodItemWidget(this._foodItem);
  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  final itemIcon = Icons.favorite_border;

  FoodItemDataModel mapFoodItemWidgetToModel(FoodItemWidgetModel item) {
    FoodItemDataModel data = FoodItemDataModel(
      id: item.id,
      title: item.title,
      foodItemCategory: item.foodItemCategory,
      mealCategory: item.mealCategory,
    );
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    final colorTheme = mainTheme.primaryColor;
    final backgroundColor = mainTheme.backgroundColor;
    DailyDiet diet = Provider.of<DailyDiet>(context, listen: false);
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget._foodItem.isSelected = !widget._foodItem.isSelected;
            });
            FoodItemDataModel foodItem;
            if (widget._foodItem.isSelected) {
              foodItem = mapFoodItemWidgetToModel(widget._foodItem);
              diet.addItem(foodItem);
            } else {
              diet.removeItem(widget._foodItem.id);
            }
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
                      ? Border.all(color: colorTheme, width: 2)
                      : Border.all(color: Colors.grey[350], width: 2),
                  gradient: widget._foodItem.isSelected
                      ? LinearGradient(
                          colors: [
                            colorTheme.withOpacity(0.0),
                            colorTheme.withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : LinearGradient(
                          colors: [
                            backgroundColor.withOpacity(0.0),
                            backgroundColor.withOpacity(0.4),
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
