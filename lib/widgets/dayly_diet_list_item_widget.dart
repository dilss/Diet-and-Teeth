import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(vertical: 1),
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
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    '22',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.cyan),
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
                      fontSize: 16,
                      color: Colors.cyan),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  alignment: Alignment.centerRight,
                  onPressed: () {},
                ),
              ),
            ),
            onDismissed: (direction) {
              _dietListData.removeDaylyDiet(_daylyDiet.uuid);
            },
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Text('Excluir dieta?'),
                  actions: [
                    FlatButton(
                      child: Text(
                        'Não',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.cyan),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Sim',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.cyan),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
