import 'package:diet_and_teeth_app/core/services/database.dart';
import 'package:diet_and_teeth_app/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../core/models/daily_diet_data.dart';
import 'confirm_deletion_dialog.dart';
import 'daily_diet_item_table.dart';

class DailyDietListItemWidget extends StatelessWidget {
  final DailyDiet _daylyDiet;

  DailyDietListItemWidget(this._daylyDiet);

  void _editButtonPressed(BuildContext context, Database database) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            Provider<DailyDiet>(
              create: (_) => DailyDiet(),
            ),
            Provider<Database>.value(value: database),
          ],
          child: TabsScreen(isEditMode: true, diet: _daylyDiet),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _database = Provider.of<Database>(context, listen: false);
    final uuid = Uuid();
    return StreamBuilder<List<DailyDiet>>(
        stream: _database.dietsStream(),
        builder: (context, snapshot) {
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
                            child: DailyDietItemTable(daylyDiet: _daylyDiet),
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
                                  onPressed: () =>
                                      _editButtonPressed(context, _database),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 30,
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => ConfirmDeletionDialog(),
                                    ).then((value) => value
                                        ? _database.deleteDiet(_daylyDiet)
                                        : null);
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
                    _database.deleteDiet(_daylyDiet);
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
        });
  }
}
