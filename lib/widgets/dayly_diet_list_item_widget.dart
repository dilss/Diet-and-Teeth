import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dayly_diet_data_provider.dart';

import 'package:uuid/uuid.dart';

class DaylyDietListItemWidget extends StatelessWidget {
  final String _dayOfWeeek;
  final String _dietDate;

  DaylyDietListItemWidget(this._dayOfWeeek, this._dietDate);

  @override
  Widget build(BuildContext context) {
    final uuid = Uuid();
    return Dismissible(
      key: ValueKey(uuid.v1()),
      direction: DismissDirection.endToStart,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: CircleAvatar(),
          title: Text(_dayOfWeeek),
          subtitle: Text(_dietDate),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 35,
          ),
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
