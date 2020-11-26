import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../core/providers/diets_list_provider.dart';
import '../../core/models/dayly_diet_data.dart';
import 'confirm_deletion_dialog.dart';
import 'dayly_diet_item_table.dart';

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
                    DevUtils.getWeekDayFromString(
                        date: _daylyDiet.date, short: false),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    _daylyDiet.date,
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
                      child: DaylyDietItemTable(daylyDiet: _daylyDiet),
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
                                _dietListData.removeDaylyDiet(_daylyDiet.date);
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
              _dietListData.removeDaylyDiet(_daylyDiet.date);
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
