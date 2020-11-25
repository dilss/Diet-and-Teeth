import 'package:flutter/material.dart';

import '../../core/models/dayly_diet_data.dart';
import '../../core/models/meal_category_enum.dart';

class DaylyDietItemTable extends StatelessWidget {
  const DaylyDietItemTable({
    Key key,
    @required DaylyDiet daylyDiet,
  })  : _daylyDiet = daylyDiet,
        super(key: key);

  final DaylyDiet _daylyDiet;

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
