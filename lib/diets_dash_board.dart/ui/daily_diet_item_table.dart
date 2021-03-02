import 'package:diet_and_teeth_app/diets_dash_board.dart/models/daily_diet_model.dart';
import 'package:diet_and_teeth_app/diets_dash_board.dart/models/meal_category_enum.dart';
import 'package:flutter/material.dart';

class DailyDietItemTable extends StatelessWidget {
  const DailyDietItemTable({
    Key key,
    @required DailyDiet daylyDiet,
  })  : _daylyDiet = daylyDiet,
        super(key: key);

  final DailyDiet _daylyDiet;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Refeição',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Itens',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(
              Text(
                'Café da Manhã',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            DataCell(
              Text(
                _daylyDiet
                    .howManyItemsForMeal(MealCategoryEnum.breakfast)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(
              Text(
                'Almoço',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
            DataCell(
              Text(
                _daylyDiet
                    .howManyItemsForMeal(MealCategoryEnum.lunch)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
              'Lanche da Tarde',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            )),
            DataCell(
              Text(
                _daylyDiet
                    .howManyItemsForMeal(MealCategoryEnum.afternoonSnack)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
              'Jantar',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            )),
            DataCell(
              Text(
                _daylyDiet
                    .howManyItemsForMeal(MealCategoryEnum.dinner)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text(
              'Fora das Refeições',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            )),
            DataCell(
              Text(
                _daylyDiet
                    .howManyItemsForMeal(MealCategoryEnum.extras)
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
