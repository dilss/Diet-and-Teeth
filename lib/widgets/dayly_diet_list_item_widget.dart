import 'package:diet_and_teeth_app/models/types/meal_category_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import '../providers/diets_list_provider.dart';
import '../models/data_models/dayly_diet_data.dart';

class DaylyDietListItemWidget extends StatelessWidget {
  final DaylyDiet _daylyDiet;

  DaylyDietListItemWidget(this._daylyDiet);

  @override
  Widget build(BuildContext context) {
    final uuid = Uuid();
    final _dietListData = Provider.of<DietsList>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        overflow: Overflow.clip,
        fit: StackFit.loose,
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 35,
            ),
          ),
          Dismissible(
            key: ValueKey(uuid.v1()),
            direction: DismissDirection.endToStart,
            child: Card(
              shadowColor: Colors.black,
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              borderOnForeground: false,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.cyan[80],
                    child: FittedBox(
                      child: Text(
                        _daylyDiet.harmfulPotential.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    DevUtils.getDay(date: _daylyDiet.date, short: false),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    DevUtils.getFormatedDate(_daylyDiet.date),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.cyan,
                    ),
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.cyan[50],
                      ),
                      child: DataTable(
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
                                      .howManyItemsForMeal(
                                          MealCategoryEnum.breakfast)
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
                                      .howManyItemsForMeal(
                                          MealCategoryEnum.lunch)
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
                                      .howManyItemsForMeal(
                                          MealCategoryEnum.afternoonSnack)
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
                                      .howManyItemsForMeal(
                                          MealCategoryEnum.dinner)
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
                                      .howManyItemsForMeal(
                                          MealCategoryEnum.extras)
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
                      ),
                    ),
                    ListTile(
                      trailing: Wrap(
                        spacing: 12,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 30,
                            ),
                            color: Colors.green,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            color: Colors.red,
                            onPressed: () {
                              final deletionConfirmed = showDialog(
                                context: context,
                                builder: (ctx) => ConfirmDeletionDialog(),
                              );
                              if (deletionConfirmed == true) {
                                _dietListData.removeDaylyDiet(_daylyDiet.uuid);
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                  trailing: Container(
                    child: Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              _dietListData.removeDaylyDiet(_daylyDiet.uuid);
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (ctx) => ConfirmDeletionDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ConfirmDeletionDialog extends StatelessWidget {
  const ConfirmDeletionDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text('Excluir dieta?'),
      actions: [
        FlatButton(
          child: Text(
            'Não',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan),
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        FlatButton(
          child: Text(
            'Sim',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan),
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
